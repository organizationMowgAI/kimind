
:- use_module(file_module).

test(Module) :- 
    %gtrace,
    file_module:load_module(Module),
    Module:assert(f(9)),
    file_module:save_module(Module).