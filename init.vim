set backupdir=~/.local/share/nvim/backup//

lua << EOF
require('tm')
EOF

nnoremap <expr> <F8> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
