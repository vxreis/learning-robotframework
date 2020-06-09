import os, sys
from time import gmtime, strftime


def run_tests():
    # Gerando doc com os casos de teste
    cmd = 'python -m robot.testdoc -N "Suite web My Store" tests testdoc.html'
    print(cmd)
    os.system(cmd)

    # Executando
    dts = strftime('%Y.%m.%d.%H.%M.%S', gmtime())

    cmd = 'robot -d Results/Run%s -L trace' % dts  # Pasta onde vou salvar os relatórios
    cmd += ' -v BROWSER:chrome'  # Browser que irei usar
    cmd += ' tests'  # Pasta onde estão os suites de teste
    print(cmd)
    os.system(cmd)


if __name__ == '__main__':
    browsers = ['chrome', 'firefox', 'ie']
    info = 'Informe um dos browsers: %s' % browsers

    try:
        browser = sys.argv[1].lower()
        if browser.lower() in browsers:
            run_tests(browser)
        else:
            print(info)
    except IndexError:
        print(info)
