set backupdir=~/.local/share/nvim/backup//
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
lua << EOF

require('tm')
EOF
