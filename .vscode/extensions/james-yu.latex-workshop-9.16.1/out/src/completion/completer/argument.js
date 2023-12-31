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
exports.provider = void 0;
const vscode = __importStar(require("vscode"));
const lw_1 = require("../../lw");
const types_1 = require("../../types");
const completerutils_1 = require("./completerutils");
exports.provider = { from };
function from(result, args) {
    if (result[1] === 'usepackage') {
        return providePackageOptions(args.line);
    }
    if (result[1] === 'documentclass') {
        return provideClassOptions(args.line);
    }
    const index = getArgumentIndex(result[2]);
    const packages = lw_1.lw.completion.usepackage.getAll(args.langId);
    let candidate;
    let environment;
    if (result[1] === 'begin') {
        environment = result[2].match(/{(.*?)}/)?.[1];
    }
    for (const packageName of Object.keys(packages)) {
        if (environment) {
            const environments = lw_1.lw.completion.environment.getEnvFromPkg(packageName, types_1.EnvSnippetType.AsCommand) || [];
            for (const env of environments) {
                if (environment !== env.signature.name) {
                    continue;
                }
                if (index !== env.keyvalpos + 1) { // Start from one.
                    continue;
                }
                candidate = env;
            }
        }
        else {
            const commands = lw_1.lw.completion.macro.getPackageCmds(packageName);
            for (const command of commands) {
                if (result[1] !== command.signature.name) {
                    continue;
                }
                if (index !== command.keyvalpos) {
                    continue;
                }
                candidate = command;
                break;
            }
        }
        if (candidate !== undefined) {
            break;
        }
    }
    const suggestions = candidate?.keyvals?.map(option => {
        const item = new vscode.CompletionItem(option, vscode.CompletionItemKind.Constant);
        item.insertText = new vscode.SnippetString(option);
        return item;
    }) || [];
    (0, completerutils_1.filterArgumentHint)(suggestions);
    return suggestions;
}
function providePackageOptions(line) {
    const regex = /\\usepackage.*{(.*?)}/;
    const match = line.match(regex);
    if (!match) {
        return [];
    }
    lw_1.lw.completion.usepackage.load(match[1]);
    const suggestions = lw_1.lw.completion.usepackage.getOpts(match[1])
        .map(option => {
        const item = new vscode.CompletionItem(option, vscode.CompletionItemKind.Constant);
        item.insertText = new vscode.SnippetString(option);
        return item;
    });
    (0, completerutils_1.filterArgumentHint)(suggestions);
    return suggestions;
}
function provideClassOptions(line) {
    const regex = /\\documentclass.*{(.*?)}/s;
    const match = line.match(regex);
    if (!match) {
        return [];
    }
    const isDefaultClass = ['article', 'report', 'book'].includes(match[1]);
    lw_1.lw.completion.usepackage.load(isDefaultClass ? 'latex-document' : `class-${match[1]}`);
    const suggestions = lw_1.lw.completion.usepackage.getOpts(isDefaultClass ? 'latex-document' : `class-${match[1]}`)
        .map(option => {
        const item = new vscode.CompletionItem(option, vscode.CompletionItemKind.Constant);
        item.insertText = new vscode.SnippetString(option);
        return item;
    });
    (0, completerutils_1.filterArgumentHint)(suggestions);
    return suggestions;
}
function getArgumentIndex(argstr) {
    let argumentIndex = 0;
    let curlyLevel = argstr[0] === '{' ? 1 : 0;
    let squareLevel = argstr[0] === '[' ? 1 : 0;
    for (let index = 1; index < argstr.length; index++) {
        if (argstr[index - 1] === '\\') {
            continue;
        }
        switch (argstr[index]) {
            case '{':
                curlyLevel++;
                break;
            case '[':
                squareLevel++;
                break;
            case '}':
                curlyLevel--;
                if (curlyLevel === 0 && squareLevel === 0) {
                    argumentIndex++;
                }
                break;
            case ']':
                squareLevel--;
                if (curlyLevel === 0 && squareLevel === 0) {
                    argumentIndex++;
                }
                break;
            default:
                break;
        }
    }
    return argumentIndex;
}
//# sourceMappingURL=argument.js.map