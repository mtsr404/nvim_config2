hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mtsr_original"


hi SpecialKey      ctermfg=240 guifg=#585858
hi link EndOfBuffer  NonText
hi TermCursor      cterm=reverse gui=reverse
hi clear TermCursorNC    
hi NonText         ctermfg=240 guifg=#585858
hi Directory       ctermfg=73 guifg=#5fafaf
hi ErrorMsg        ctermfg=235 ctermbg=131 guifg=#262626 guibg=#af5f5f
hi IncSearch       ctermfg=235 ctermbg=131 guifg=#262626 guibg=#af5f5f
hi Search          ctermfg=235 ctermbg=229 guifg=#262626 guibg=#ffffaf
hi MoreMsg         ctermfg=66 guifg=#5f8787
hi ModeMsg         ctermfg=235 ctermbg=108 guifg=#262626 guibg=#87af87
hi LineNr          ctermfg=242 ctermbg=234 guifg=#6c6c6c guibg=#1c1c1c
hi CursorLineNr    ctermfg=73 ctermbg=236 guifg=#5fafaf guibg=#303030
hi Question        ctermfg=108 guifg=#87af87
hi StatusLine      ctermfg=235 ctermbg=101 guifg=#262626 guibg=#87875f
hi StatusLineNC    ctermfg=101 ctermbg=238 guifg=#87875f guibg=#444444
hi VertSplit       ctermfg=238 ctermbg=238 guifg=#444444 guibg=#444444
hi Title           ctermfg=231 guifg=#ffffff
hi Visual          cterm=bold ctermbg=235 guibg=#303e51
hi clear VisualNC        
hi WarningMsg      ctermfg=131 guifg=#af5f5f
hi WildMenu        ctermfg=235 ctermbg=110 guifg=#262626 guibg=#8fafd7
hi Folded          ctermfg=242 ctermbg=234 guifg=#6c6c6c guibg=#1c1c1c
hi FoldColumn      ctermfg=242 ctermbg=234 guifg=#6c6c6c guibg=#1c1c1c
hi DiffAdd         cterm=bold ctermbg=65 gui=bold guibg=#1f3b40
hi DiffChange      cterm=bold ctermbg=58 gui=bold guibg=#444444
hi DiffDelete      cterm=bold ctermfg=230 gui=bold guibg=#483932
hi DiffText        cterm=bold ctermbg=233 gui=bold guibg=#1c1d03
hi SignColumn      ctermfg=242 ctermbg=234 guifg=#6c6c6c guibg=#1c1c1c
hi Conceal         ctermfg=250 guifg=#bcbcbc
hi SpellBad        cterm=undercurl ctermfg=131 gui=undercurl guifg=#af5f5f
hi SpellCap        cterm=undercurl ctermfg=73 gui=undercurl guifg=#5fafaf
hi SpellRare       cterm=undercurl ctermfg=208 gui=undercurl guifg=#ff8700
hi SpellLocal      cterm=undercurl ctermfg=65 gui=undercurl guifg=#5f875f
hi Pmenu           ctermfg=250 ctermbg=238 guifg=#bcbcbc guibg=#444444
hi PmenuSel        ctermfg=235 ctermbg=66 guifg=#262626 guibg=#5f8787
hi PmenuSbar       ctermbg=240 guibg=#585858
hi PmenuThumb      ctermfg=66 ctermbg=66 guifg=#5f8787 guibg=#5f8787
hi TabLine         ctermfg=101 ctermbg=238 guifg=#87875f guibg=#444444
hi TabLineSel      ctermfg=235 ctermbg=101 guifg=#262626 guibg=#87875f
hi TabLineFill     ctermfg=238 ctermbg=238 guifg=#444444 guibg=#444444
hi CursorColumn    ctermbg=236 guibg=#303030
hi CursorLine      ctermbg=236 guibg=#303030

hi ColorColumn     ctermbg=234 guibg=#1c1c1c
hi link QuickFixLine Search
hi link Whitespace NonText
hi clear NormalNC        
hi Cursor          ctermbg=242 guibg=#6c6c6c
hi lCursor         guifg=bg guibg=fg
hi link Substitute Search
hi MatchParen      ctermfg=229 ctermbg=234 guifg=#ffffaf guibg=#1c1c1c
hi Normal          ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
hi Comment         ctermfg=240 guifg=#888888
hi Constant        ctermfg=180 guifg=#ba6d16
hi Special         ctermfg=65 guifg=#bcbcbc
hi Identifier      ctermfg=67 guifg=#5f87af
hi Statement       ctermfg=110 guifg=#8fafd7
hi PreProc         ctermfg=66 guifg=#5f8787
hi Type            ctermfg=103 guifg=#8787af
hi Underlined      cterm=underline ctermfg=66 gui=underline guifg=#5f8787
hi clear Ignore          
hi Error           cterm=reverse ctermfg=131 gui=reverse guifg=#af5f5f guibg=#222222
hi Todo            cterm=reverse gui=reverse
hi String          ctermfg=180 guifg=#d3b987
hi Character       ctermfg=180 guifg=#d3b987
hi link Number Constant
hi link Boolean Constant
hi link Float Number
hi Function        ctermfg=229 guifg=#ffffaf
hi link Conditional Statement
hi link Repeat Statement
hi Label           ctermfg=180 guifg=#d3b987
hi link Operator Statement
hi Keyword         ctermfg=110 guifg=#d7a78e
hi link Exception Statement
hi link Include PreProc
hi Define          ctermfg=110 guifg=#d7a78e
hi link Macro PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi clear helpLeadBlank   
hi clear helpNormal      
hi StatusLineTerm  ctermfg=235 ctermbg=101 guifg=#262626 guibg=#87875f
hi StatusLineTermNC  ctermfg=101 ctermbg=238 guifg=#87875f guibg=#444444
hi VisualNOS       cterm=underline gui=underline
hi debugPC         ctermbg=67 guibg=#5f87af
hi debugBreakpoint  ctermbg=131 guibg=#af5f5f
hi link HelpCommand Statement
hi link HelpExample Statement
hi link htmlEndTag htmlTagName
hi clear htmlTagName     
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic PreProc
hi link asciidocQuotedEmphasized PreProc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String
hi phpKeyword      ctermfg=110 guifg=#d7a78e
hi phpConditional  ctermfg=110 guifg=#d7a78e
hi phpStatement    ctermfg=110 guifg=#d7a78e
hi phpIdentifier   ctermfg=110 guifg=#719cc6
hi link phpFunctions phpKeyword
hi link phpInclude phpKeyword
hi ZenkakuSpace    cterm=reverse ctermfg=5 gui=reverse guifg=DarkMagenta
hi myDeniteMatchText  guifg=#f6a3a3
hi myDeniteInsert  guibg=#3d5066
hi myDeniteNormal  guifg=White guibg=#7b6980
hi link SyntasticError SpellBad
hi link SyntasticWarning SpellCap
hi link SyntasticStyleError SyntasticError
hi link SyntasticStyleWarning SyntasticWarning
hi airline_x       ctermfg=85 ctermbg=234 guifg=#9cffd3 guibg=#202020
hi airline_x_bold  cterm=bold ctermfg=85 ctermbg=234 gui=bold guifg=#9cffd3 guibg=#202020
hi airline_y       ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#444444
hi airline_y_bold  cterm=bold ctermfg=255 ctermbg=238 gui=bold guifg=#ffffff guibg=#444444
hi airline_z       ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
hi airline_z_bold  cterm=bold ctermfg=17 ctermbg=190 gui=bold guifg=#00005f guibg=#dfff00
hi airline_term    ctermfg=85 ctermbg=232 guifg=#9cffd3 guibg=#202020
hi airline_term_bold  cterm=bold ctermfg=85 ctermbg=232 gui=bold guifg=#9cffd3 guibg=#202020
hi airline_error   ctermfg=232 ctermbg=160 guifg=#000000 guibg=#990000
hi airline_error_bold  cterm=bold ctermfg=232 ctermbg=160 gui=bold guifg=#000000 guibg=#990000
hi airline_a       ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
hi airline_a_bold  cterm=bold ctermfg=17 ctermbg=190 gui=bold guifg=#00005f guibg=#dfff00
hi airline_b       ctermfg=255 ctermbg=238 guifg=#ffffff guibg=#444444
hi airline_b_bold  cterm=bold ctermfg=255 ctermbg=238 gui=bold guifg=#ffffff guibg=#444444
hi airline_c       ctermfg=85 ctermbg=234 guifg=#9cffd3 guibg=#202020
hi airline_c_bold  cterm=bold ctermfg=85 ctermbg=234 gui=bold guifg=#9cffd3 guibg=#202020
hi airline_warning  ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00
hi airline_warning_bold  cterm=bold ctermfg=232 ctermbg=166 gui=bold guifg=#000000 guibg=#df5f00
hi airline_a_to_airline_b  guifg=#dfff00 guibg=#444444
hi airline_b_to_airline_c  guifg=#444444 guibg=#202020
hi airline_c_to_airline_x  guifg=#202020 guibg=#202020
hi airline_x_to_airline_y  guifg=#444444 guibg=#202020
hi airline_y_to_airline_z  guifg=#dfff00 guibg=#444444
hi airline_z_to_airline_warning  guifg=#df5f00 guibg=#dfff00
hi airline_warning_to_airline_error  guifg=#990000 guibg=#df5f00
hi airline_c1_inactive  ctermfg=239 ctermbg=236 guifg=#4e4e4e guibg=#303030
hi link SyntasticErrorSign Error
hi link SyntasticWarningSign Todo
hi link SyntasticStyleErrorSign SyntasticErrorSign
hi link SyntasticStyleWarningSign SyntasticWarningSign
hi link SyntasticStyleErrorLine SyntasticErrorLine
hi clear SyntasticErrorLine
hi link SyntasticStyleWarningLine SyntasticWarningLine
hi clear SyntasticWarningLine
hi airline_a_to_airline_c  guifg=#dfff00 guibg=#202020
hi airline_c_to_airline_y  guifg=#444444 guibg=#202020
hi link deniteMode ModeMsg
hi link deniteMatchedRange myDeniteMatchText
hi link deniteMatchedChar myDeniteMatchText
hi link deniteStatusLinePath Comment
hi link deniteStatusLineNumber LineNr
hi link deniteSelectedLine Statement
hi clear deniteConcealedMark  
hi link deniteSourceLine_file_rec Type
hi clear deniteSource_file_rec
hi airline_c2_inactive  ctermfg=239 ctermbg=236 guifg=#4e4e4e guibg=#303030
hi airline_x_to_airline_y_bold  cterm=bold gui=bold guifg=#444444 guibg=#202020
hi airline_z_to_airline_warning_bold  cterm=bold gui=bold guifg=#df5f00 guibg=#dfff00
hi airline_b_to_airline_c_bold  cterm=bold gui=bold guifg=#444444 guibg=#202020
hi airline_a_to_airline_b_bold  cterm=bold gui=bold guifg=#dfff00 guibg=#444444
hi airline_warning_to_airline_error_bold  cterm=bold gui=bold guifg=#990000 guibg=#df5f00
hi airline_y_to_airline_z_bold  cterm=bold gui=bold guifg=#dfff00 guibg=#444444
hi airline_c_to_airline_x_bold  cterm=bold gui=bold guifg=#202020 guibg=#202020
hi airline_a_to_airline_c_bold  cterm=bold gui=bold guifg=#dfff00 guibg=#202020
hi airline_c_to_airline_y_bold  cterm=bold gui=bold guifg=#444444 guibg=#202020
hi link vimTodo Todo
hi link vimCommand Statement
hi clear vimOnlyCommand  
hi clear vimStdPlugin
hi clear vimOnlyOption   
hi clear vimTermOption   
hi link vimErrSetting vimError
hi link vimGroup Type
hi link vimHLGroup vimGroup
hi clear vimOnlyHLGroup  
hi link nvimHLGroup vimHLGroup
hi clear vimGlobal       
hi link vimSubst vimCommand
hi link vimNumber Number
hi link vimAddress vimMark
hi link vimAutoCmd vimCommand
hi clear vimIsCommand
hi clear vimExtCmd       
hi clear vimFilter       
hi link vimLet vimCommand
hi link vimMap vimCommand
hi link vimMark Number
hi clear vimSet
hi link vimSyntax vimCommand
hi clear vimUserCmd
hi clear vimCmdSep
hi link vimVar Identifier
hi link vimFBVar vimVar
hi link vimInsert vimString
hi link vimBehaveModel vimBehave
hi link vimBehaveError vimError
hi link vimBehave vimCommand
hi link vimFTCmd vimCommand
hi link vimFTOption vimSynType
hi link vimFTError vimError
hi clear vimFiletype     
hi clear vimAugroup      
hi clear vimExecute      
hi link vimNotFunc vimCommand
hi link vimFuncName Function
hi clear vimFunction     
hi link vimFunctionError vimError
hi link vimLineComment vimComment
hi link vimSpecFile Identifier
hi link vimOper Operator
hi clear vimOperParen    
hi link vimComment Comment
hi link vimString String
hi link vimRegister SpecialChar
hi link vimCmplxRepeat SpecialChar
hi clear vimRegion       
hi clear vimSynLine
hi link vimNotation Special
hi link vimCtrlChar SpecialChar
hi link vimFuncVar Identifier
hi link vimContinue Special
hi link vimAugroupKey vimCommand
hi link vimAugroupError vimError
hi link vimEnvvar PreProc
hi link vimFunc vimError
hi link vimParenSep Delimiter
hi link vimSep Delimiter
hi link vimOperError Error
hi link vimFuncKey vimCommand
hi link vimFuncSID Special
hi link vimAbb vimCommand
hi clear vimEcho         
hi link vimEchoHL vimCommand
hi clear vimIf           
hi link vimHighlight vimCommand
hi link vimNorm vimCommand
hi link vimUnmap vimMap
hi link vimUserCommand vimCommand
hi clear vimFuncBody     
hi clear vimFuncBlank    
hi link vimPattern Type
hi link vimSpecFileMod vimSpecFile
hi clear vimEscapeBrace
hi clear vimSetEqual
hi link vimSetString vimString
hi clear vimSubstRep
hi clear vimSubstRange
hi link vimUserAttrb vimSpecial
hi link vimUserAttrbError Error
hi link vimUserAttrbKey vimOption
hi link vimUserAttrbCmplt vimSpecial
hi link vimUserCmdError Error
hi link vimUserAttrbCmpltFunc Special
hi link vimCommentString vimString
hi link vimPatSepErr vimPatSep
hi link vimPatSep SpecialChar
hi link vimPatSepZ vimPatSep
hi link vimPatSepZone vimString
hi link vimPatSepR vimPatSep
hi clear vimPatRegion    
hi link vimNotPatSep vimString
hi link vimStringCont vimString
hi link vimSubstTwoBS vimString
hi link vimSubstSubstr SpecialChar
hi clear vimCollection   
hi clear vimSubstPat
hi link vimSubst1 vimSubst
hi link vimSubstDelim Delimiter
hi clear vimSubstRep4
hi link vimSubstFlagErr vimError
hi clear vimCollClass
hi link vimCollClassErr vimError
hi link vimSubstFlags Special
hi link vimMarkNumber vimNumber
hi link vimPlainMark vimMark
hi link vimPlainRegister vimRegister
hi link vimOption PreProc
hi link vimSetMod vimOption
hi link vimSetSep Statement
hi link vimMapMod vimBracket
hi clear vimMapLhs
hi link vimAutoEvent Type
hi link nvimAutoEvent vimAutoEvent
hi clear vimAutoCmdSpace
hi clear vimAutoEventList
hi clear vimAutoCmdSfxList
hi link vimEchoHLNone vimGroup
hi link vimMapBang vimCommand
hi link nvimMap vimMap
hi link nvimUnmap vimUnmap
hi clear vimMapRhs
hi link vimMapModKey vimFuncSID
hi link vimMapModErr vimError
hi clear vimMapRhsExtend
hi clear vimMenuBang     
hi clear vimMenuPriority  
hi link vimMenuName PreProc
hi link vimMenuMod vimMapMod
hi link vimMenuNameMore vimMenuName
hi clear vimMenuMap      
hi clear vimMenuRhs
hi link vimBracket Delimiter
hi link vimUserFunc Normal
hi link vimElseIfErr Error
hi link vimBufnrWarn vimWarn
hi clear vimNormCmds
hi link vimGroupSpecial Special
hi clear vimGroupList
hi link vimSynError Error
hi link vimSynContains vimSynOption
hi link vimSynKeyContainedin vimSynContains
hi link vimSynNextgroup vimSynOption
hi link vimSynType vimSpecial
hi clear vimAuSyntax
hi link vimSynCase Type
hi link vimSynCaseError vimError
hi clear vimClusterName
hi link vimGroupName vimGroup
hi link vimGroupAdd vimSynOption
hi link vimGroupRem vimSynOption
hi clear vimIskList
hi link vimIskSep Delimiter
hi link vimSynKeyOpt vimSynOption
hi clear vimSynKeyRegion
hi link vimMtchComment vimComment
hi link vimSynMtchOpt vimSynOption
hi link vimSynRegPat vimString
hi clear vimSynMatchRegion
hi clear vimSynMtchCchar
hi clear vimSynMtchGroup
hi link vimSynPatRange vimString
hi link vimSynNotPatRange vimSynRegPat
hi link vimSynRegOpt vimSynOption
hi link vimSynReg Type
hi link vimSynMtchGrp vimSynOption
hi clear vimSynRegion
hi clear vimSynPatMod
hi link vimSyncC Type
hi clear vimSyncLines
hi clear vimSyncMatch
hi link vimSyncError Error
hi clear vimSyncLinebreak
hi clear vimSyncLinecont
hi clear vimSyncRegion
hi link vimSyncGroupName vimGroupName
hi link vimSyncKey Type
hi link vimSyncGroup vimGroupName
hi link vimSyncNone Type
hi clear vimHiLink       
hi link vimHiClear vimHighlight
hi clear vimHiKeyList
hi link vimHiCtermError vimError
hi clear vimHiBang       
hi link vimHiGroup vimGroupName
hi link vimHiAttrib PreProc
hi link vimFgBgAttrib vimHiAttrib
hi link vimHiAttribList vimError
hi clear vimHiCtermColor  
hi clear vimHiFontname   
hi clear vimHiGuiFontname  
hi link vimHiGuiRgb vimNumber
hi link vimHiTerm Type
hi link vimHiCTerm vimHiTerm
hi link vimHiStartStop vimHiTerm
hi link vimHiCtermFgBg vimHiTerm
hi link vimHiGui vimHiTerm
hi link vimHiGuiFont vimHiTerm
hi link vimHiGuiFgBg vimHiTerm
hi link vimHiKeyError vimError
hi clear vimHiTermcap    
hi link vimHiNmbr Number
hi link vimCommentTitle PreProc
hi clear vimCommentTitleLeader  
hi link vimSearchDelim Statement
hi link vimSearch vimString
hi link vimEmbedError Normal
hi clear vimAugroupSyncA
hi link vimError Error
hi link vimKeyCodeError vimError
hi link vimWarn WarningMsg
hi link vimAuHighlight vimHighlight
hi link vimAutoCmdOpt vimOption
hi link vimAutoSet vimCommand
hi link vimCondHL vimCommand
hi link vimElseif vimCondHL
hi link vimFold Folded
hi link vimSynOption Special
hi link vimHLMod PreProc
hi link vimKeyCode vimSpecFile
hi link vimKeyword Statement
hi link vimScriptDelim Comment
hi link vimSpecial Type
hi link vimStatement Statement
hi airline_c3_inactive  ctermfg=239 ctermbg=236 guifg=#4e4e4e guibg=#303030
