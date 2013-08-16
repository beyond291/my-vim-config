"author : dujun d00115187 at 2008-2-7 17:49:30
"================================================
" HIGHLIGHT ALL FUNCTION
"================================================
syn match cFunction "\<[a-zA-Z_][a-zA-Z0-9_]*\>[^()]*)("me=e-2
syn match cFunction "\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*("me=e-1
syn match cFunction "\<VOS_*\>"
"hi cFunction gui=bold guifg=#FF8040
hi cFunction gui=bold guifg=#DFBE95 cterm=NONE ctermfg=172


"================================================
" HIGHLIGHT ALL MATCH OPERATOR
"================================================
" C MATCH OPERATOR
syn match cMatchOperator display "[-+\*/%=]"
" C POINTER OPERATOR
syn match cPointerOperator display "->\|\." 
" C LOGIC OPERATOR
syn match cLogicalOperator display "[!<>]=\="
syn match cLogicalOperator display "=="
" C BIT OPERATOR 
syn match cBinaryOperator display "\(&\||\|\^\|<<\|>>\)=\="
syn match cBinaryOperator  display "\~"
syn match cBinaryOperatorError display "\~="
" MORE C LOGICAL OPERATOR-HIGHLIGHT IN PREFREENCE TO BINARY
syn match cLogicalOperator display "&&\|||" 
syn match cLogicalOperatorError display "\(&&\|||\)=" 
" MATCH OPERATOR
"hi cMatchOperator guifg=#3EFFE2
"hi cPointerOperator guifg=#3EFFE2
"hi cLogicalOperator guifg=#3EFFE2
"hi cBinaryOperator guifg=#3EFFE2
"hi cBinaryOperatorError guifg=#3EFFE2
"hi cLogicalOperatorError guifg=#3EFFE2
hi cMatchOperator guifg=#F0EFD0 cterm=NONE ctermfg=231
hi cPointerOperator guifg=#F0EFD0 cterm=NONE ctermfg=231
hi cLogicalOperator guifg=#F0EFD0 cterm=NONE ctermfg=231
hi cBinaryOperator guifg=#F0EFD0  cterm=NONE ctermfg=231
hi cBinaryOperatorError guifg=#F0EFD0 cterm=NONE ctermfg=231
hi cLogicalOperatorError guifg=#F0EFD0 cterm=NONE ctermfg=231

" MATCH MICRO
"syn match Macro display "\<[^a-z0-9][A-Z_0-9]*[^a-z0-9]\>"
syn match Macro display "\<[^a-z0-9][A-Z_0-9]*[^a-z]\>"
" MATCH GLOBAL VARIANT
syn match cGlobal display "\<g_[a-zA-Z0-9_]*\>"
syn match cGlobal display "\<m_[a-zA-Z0-9_]*\>"
"hi cGlobal guifg=#FF80C0
hi cGlobal guifg=#EAB882
"================================================
" MORE OWN DATA TYPE
"================================================
"syn keyword Type ULONG UCHAR VOID FULL_KEY_S HASH_KEY_S HASH_BKT_ENTRY_S SHOWBAR_S VCAM_LINK_S KEY_S VOS_INT32 VOS_UINT32 VOS_INT16 VOS_UINT16 VOS_INT8 VOS_UINT8
