import os
from time import gmtime, strftime

# Gerando doc com os casos de teste
cmd = 'python -m robot.testdoc -N "Suite test template example" TestCases testdoc.html'
print(cmd)
os.system(cmd)

# Executando
dts = strftime('%Y.%m.%d.%H.%M.%S', gmtime())

cmd = 'robot -d Results/Run%s -L trace' % dts
cmd += ' -v BROWSER:chrome'
cmd += ' TestCases'
print(cmd)
os.system(cmd)
