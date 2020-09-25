import os
import subprocess
import socket
from appium import webdriver
from time import sleep
from shutil import copyfile


def get_device_data(device_name):
    devices = {
        # Name : udid, port, bootstrap/system_port, useid
        'moto_g5': ['0044322741', '4723', '4724', 0],
        'iphone_7': ['04ac9f0ebc2f7e57ac7bf25569ee1ecd1d7997d7', '4725', '4726', 1]
        }

    device = devices[device_name.lower()]
    return device[0], device[1], device[2], device[3]


def start_appium(device_name, result_path):
    device = get_device_data(device_name)
    start_appium_server(result_path, device[0], device[1], device_name)


def start_appium_server(result_path, udid, port, device_name):
    """

    :param result_path: constants.RESULT_PATH
    :param udid:
    :param port:
    :return:
    """
    # Verify if port is already in use
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        s.bind(("127.0.0.1", int(port)))
        s.close()
    except:
        return

    full_log_path = result_path + "/appium.log"

    if 'iphone' in device_name:
        subprocess.check_call("osascript -e 'tell application \"Terminal\" to do script \"appium --address 127.0.0.1 --port {0} " \
                            "--udid {1} --log {2} --log-timestamp --session-override\"'".format(port, udid, full_log_path), shell=True)
    else:
        cmd_line_appium_svr = 'appium --address 127.0.0.1 --port {0} ' \
                            '--udid {1} --log {2} --log-timestamp --session-override'.format(port, udid, full_log_path)

    subprocess.check_call(["start", "cmd", "/k", cmd_line_appium_svr], shell=True)


def rename_apk(app, device_name):
    new_name = app + '_' + device_name + '.apk'
    if not os.path.exists(new_name):
        copyfile(app, new_name)
    return new_name