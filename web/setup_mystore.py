import os
import sys
import argparse
from time import gmtime, strftime


def run_tests(browser, tags):
    # Gerando doc com os casos de teste
    cmd = 'python -m robot.testdoc -N "Suite web My Store" tests testdoc.html'
    os.system(cmd)

    # Executando
    folder_name = strftime('%Y.%m.%d.%H.%M.%S', gmtime())

    # Organizando as tags
    tag = ''
    for t in tags.split(','):
        tag += ' -i {0}'.format(t)

    # Montando a execução do robot
    cmd = 'robot {}'.format(tag)  # Inclusão das tags (se houver)
    cmd += ' -d Results/Run{} -L trace'.format(folder_name)  # Pasta onde vou salvar os relatórios
    cmd += ' -v BROWSER:{}'.format(browser)   # Browser que irei usar
    cmd += ' tests'  # Pasta onde estão os suites de teste
    print('Run robot: {}'.format(cmd))
    os.system(cmd)


if __name__ == '__main__':
    # Vamos pegar os parâmetros
    parser = argparse.ArgumentParser()
    parser.add_argument("-b", help="Select what browser to run", default='chrome')
    parser.add_argument("-t", help="Select tags to run", default='')
    args = parser.parse_args()

    browser_from_cmd = args.b
    tags_from_cmd = args.t

    browsers = ['chrome', 'firefox', 'ie']
    info = 'Informe os parâmetros corretamente' \
           '\nExemplo: -p=<browser> -t=<tag1,tag2>' \
           '\nBrowsers suportados: {0}'.format(browsers)

    try:
        browser_from_cmd = browser_from_cmd.lower()
        if browser_from_cmd.lower() in browsers:
            run_tests(browser_from_cmd, tags_from_cmd)
        else:
            print(info)
    except IndexError:
        print(info)
