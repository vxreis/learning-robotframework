import os
import argparse
from time import gmtime, strftime


def run_tests(devices):
    # Gerando doc com os casos de teste
    cmd = 'python -m robot.testdoc -N "Suite Mobile" TestCases testdoc.html'
    print(cmd)
    os.system(cmd)

    # Executando
    dts = strftime('%Y.%m.%d.%H.%M.%S', gmtime())

    for device_name in devices.split(','):
        cmd = 'robot -d Results/Run{0}/{1} -L trace'.format(dts, device_name)
        cmd += ' -v DEVICE_NAME:{}'.format(device_name)
        cmd += ' TestCases'
        print(cmd)
        os.system(cmd)


if __name__ == '__main__':
    # Vamos pegar os parâmetros
    info = "Enter the device name"
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", help=info, default='')
    args = parser.parse_args()

    devices_from_cmd = args.d

    if devices_from_cmd:
        run_tests(devices_from_cmd)
    else:
        print(info)
