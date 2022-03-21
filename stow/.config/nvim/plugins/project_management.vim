let g:startify_session_dir = has('unix') ? '~/.config/nvim/session' :  '~/AppData/Local/nvim/session'
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ ]

let init_path = has('unix') ? '~/.config/nvim/init.vim' : '~/AppData/Local/nvim/init.vim' 
let g:startify_bookmarks = [
            \ { 'i': init_path},
            \ ]
let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_custom_header = [
            \':::::::::::      :::    :::  ::::::::  :::::::::       :::     ::: ::::::::::: ::::    ::::  ::::    ::::      :::     :::        ',
            \'    :+:          :+:    :+: :+:    :+: :+:    :+:      :+:     :+:     :+:     +:+:+: :+:+:+ +:+:+: :+:+:+   :+: :+:   :+:        ',
            \'    +:+          +:+    +:+ +:+    +:+ +:+    +:+      +:+     +:+     +:+     +:+ +:+:+ +:+ +:+ +:+:+ +:+  +:+   +:+  +:+        ',
            \'    +#+          +#++:++#++ +#+    +:+ +#++:++#+       +#+     +:+     +#+     +#+  +:+  +#+ +#+  +:+  +#+ +#++:++#++: +#+        ',
            \'    +#+          +#+    +#+ +#+    +#+ +#+    +#+       +#+   +#+      +#+     +#+       +#+ +#+       +#+ +#+     +#+ +#+        ',
            \'    #+#          #+#    #+# #+#    #+# #+#    #+#        #+#+#+#       #+#     #+#       #+# #+#       #+# #+#     #+# #+#        ',
            \'###########      ###    ###  ########  #########           ###     ########### ###       ### ###       ### ###     ### ########## '
        \]
