"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.findNewCommand = void 0;
const vscode = __importStar(require("vscode"));
const path = __importStar(require("path"));
const lw_1 = require("../../../lw");
const logger = lw_1.lw.log('Preview', 'Math');
async function findNewCommand(ctoken) {
    let newcommand = '';
    const filepaths = [];
    const configuration = vscode.workspace.getConfiguration('latex-workshop');
    const newcommandPath = await resolveNewCommandFile(configuration.get('hover.preview.newcommand.newcommandFile'));
    if (newcommandPath !== undefined) {
        filepaths.push(newcommandPath);
        if (lw_1.lw.cache.get(newcommandPath) === undefined) {
            lw_1.lw.cache.add(newcommandPath);
        }
    }
    if (configuration.get('hover.preview.newcommand.parseTeXFile.enabled')) {
        lw_1.lw.cache.getIncludedTeX().forEach(filepath => filepaths.push(filepath));
    }
    for (const filepath of filepaths) {
        if (ctoken?.isCancellationRequested) {
            return '';
        }
        await lw_1.lw.cache.wait(filepath);
        const content = lw_1.lw.cache.get(filepath)?.content;
        const ast = lw_1.lw.cache.get(filepath)?.ast;
        if (content === undefined || ast === undefined) {
            logger.log(`Cannot parse the AST of ${filepath} .`);
        }
        else {
            newcommand += parseAst(content, ast).join('\n') + '\n';
        }
    }
    return newcommand;
}
exports.findNewCommand = findNewCommand;
function parseAst(content, node) {
    let macros = [];
    const args = node.type === 'macro' && node.args;
    // \newcommand{\fix}[3][]{\chdeleted{#2}\chadded[comment={#1}]{#3}}
    // \newcommand\WARNING{\textcolor{red}{WARNING}}
    const isNewCommand = node.type === 'macro' &&
        ['renewcommand', 'newcommand'].includes(node.content) &&
        node.args?.[2]?.content?.[0]?.type === 'macro';
    // \DeclarePairedDelimiterX\braketzw[2]{\langle}{\rangle}{#1\,\delimsize\vert\,\mathopen{}#2}
    const isDeclarePairedDelimiter = node.type === 'macro' &&
        ['DeclarePairedDelimiter', 'DeclarePairedDelimiterX', 'DeclarePairedDelimiterXPP'].includes(node.content) &&
        node.args?.[0]?.content?.[0]?.type === 'macro';
    const isProvideCommand = node.type === 'macro' &&
        ['providecommand', 'DeclareMathOperator', 'DeclareRobustCommand'].includes(node.content) &&
        node.args?.[1]?.content?.[0]?.type === 'macro';
    if (args && (isNewCommand || isDeclarePairedDelimiter || isProvideCommand)) {
        // \newcommand{\fix}[3][]{\chdeleted{#2}\chadded[comment={#1}]{#3}}
        // \newcommand\WARNING{\textcolor{red}{WARNING}}
        const start = node.position?.start.offset ?? 0;
        let lastArg = args[args.length - 1];
        let lastContent = lastArg.content[lastArg.content.length - 1];
        let closeBraceOffset = 0;
        while (lastContent.type === 'macro' && lastContent.args && lastContent.args.length > 0) {
            closeBraceOffset += lastArg.closeMark.length;
            lastArg = lastContent.args[lastContent.args.length - 1];
            lastContent = lastArg.content[lastArg.content.length - 1];
        }
        const end = (lastArg.content[lastArg.content.length - 1].position?.end.offset ?? -1 - closeBraceOffset) + closeBraceOffset;
        macros.push(content.slice(start, end + 1));
    }
    if ('content' in node && typeof node.content !== 'string') {
        for (const subNode of node.content) {
            macros = [...macros, ...parseAst(content, subNode)];
        }
    }
    return macros;
}
async function resolveNewCommandFile(filepath) {
    if (filepath === '') {
        return undefined;
    }
    let filepathAbs;
    if (path.isAbsolute(filepath)) {
        filepathAbs = filepath;
    }
    else {
        if (lw_1.lw.root.file.path === undefined) {
            await lw_1.lw.root.find();
        }
        const rootDir = lw_1.lw.root.dir.path;
        if (rootDir === undefined) {
            logger.log(`Cannot identify the absolute path of new command file ${filepath} without root file.`);
            return undefined;
        }
        filepathAbs = path.join(rootDir, filepath);
    }
    if (await lw_1.lw.file.exists(vscode.Uri.file(filepathAbs))) {
        return filepathAbs;
    }
    return undefined;
}
//# sourceMappingURL=newcommandfinder.js.map