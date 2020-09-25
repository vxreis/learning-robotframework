import configparser
import pathlib

def get_variables(varname, filename):
    config = configparser.ConfigParser()
    config.read(pathlib.Path(__file__).parent.absolute().joinpath(filename))

    variables = {}
    for section in config.sections():
        for key, value in config.items(section):
            var = "%s.%s.%s" % (varname, section, key)
            variables[var] = value
    return variables
