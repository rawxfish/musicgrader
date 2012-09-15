 #!/usr/bin/env ruby


id = ARGV.first

file = File.new("internal_tools/script_#{id}.sh", 'w')

file.puts("#!/bin/bash\n")
file.puts("aubionotes -i internal_tools/#{id}.wav -v > internal_tools/#{id}-aubionotes\n");
file.puts("aubiotrack -i internal_tools/#{id}.wav -v > internal_tools/#{id}-aubiotrack\n");

file.close


system("chmod +x internal_tools/script_#{id}.sh");
system("internal_tools/script_#{id}.sh");
