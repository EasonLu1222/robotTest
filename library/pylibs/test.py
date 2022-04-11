
import os
import getpass
import win32gui


def get_variables(config_path):
    import configparser
    config = configparser.ConfigParser()
    config.read(config_path)

    variables = {}
    print(config.sections)
    for section in config.sections():
        for key, value in config.items(section):
            var = "%s.%s" % (section, key)
            variables[var] = value
    #print("variables",variables)
    return variables


test_path = os.path.abspath(os.path.join(os.getcwd(), "../.."))
test_all = f"{test_path}" + "\\resources\\shared_device"
print(test_all)
shared_device = get_variables(test_all)
print("shared_device", shared_device)
key = "id"
for each_key, each_value in shared_device.items():
    if "tags" in each_key and 'android' == each_value.lower():
        found_section = each_key.split(".")[0]
        print("found_section", found_section)
        break
test1 = shared_device[f"{found_section}.{key}"]
print("test1", test1)



test2 = USER_PATH = f'C:/Users/{getpass.getuser()}'
print(test2)

path_all = f"{test2}" + "\\PycharmProjects\\robotTest\\resources\\shared_device"
print(path_all)


id = "1"
key = "region"

USER_PATH = f'C:/Users/{getpass.getuser()}'
path_all = f"{USER_PATH}" + "\\PycharmProjects\\robotTest\\resources\\shared_account"
shared_device = get_variables(path_all)
print("shared_device", shared_device)
for each_key, each_value in shared_device.items():
    if f"account_{id}.{key}".lower() in each_key.lower():
        found_section = each_key

test = shared_device[found_section]
print("test", test)




