
define init-peda
  source ~/tools/GdbPlugins/peda/peda.py
end
document init-peda
  Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
  source ~/tools/GdbPlugins/pwndbg/gdbinit.py 
end
document init-pwndbg
  Initializes PwnDBG
end

define init-gef
  source ~/tools/GdbPlugins/gef/gef.py
end
document init-gef
  Initializes GEF (GDB Enhanced Features)
end

define init-pedaheap
  source  ~/tools/GdbPlugins/peda-heap/peda.py
end
document init-pedaheap
  Initializes peda-heap
end
