vim.cmd[[
  let g:mkdp_open_to_the_world = 1
  let g:mkdp_open_ip = '127.0.0.1' " change to you vps or vm ip
  let g:mkdp_port = 1537
  function! g:EchoUrl(url)
  :echo a:url
  endfunction
  let g:mkdp_browserfunc = 'g:EchoUrl'
]]
