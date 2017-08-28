define_command(:www,
               doc: "Web Broser for Textbringer") do

  url = read_from_minibuffer("URL?> ")
  Www::Client.new(url)
end
#GLOBAL_MAP.define_key("\C-x\C-w", :www)
#EOL
