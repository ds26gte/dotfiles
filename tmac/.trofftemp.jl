function evaljl4troff_preamble(f)
global new_STDOUT
new_STDOUT = open(f, "w")
STDOUT = new_STDOUT
println(new_STDOUT, ".ecr")
end
function evaljl4troff_postamble()
global new_STDOUT
STDOUT = new_STDOUT
println(new_STDOUT, ".ecs")
println(new_STDOUT, ".ds evaljl4troff:status done")
close(new_STDOUT)
end
evaljl4troff_preamble(".trofftemp_jl_1.tmp")
STDOUT = new_STDOUT
print(0+ pi)
println(".")
evaljl4troff_postamble()
