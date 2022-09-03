yaml_file = open('pubspec.yaml', 'r')
lines = yaml_file.readlines()

newLines = []

for i in range(0, len(lines)):
    if i == 5:
        data = lines[i].split(' ')

        old_version_data = data[-1].strip().split('+')

        version_info = old_version_data[0].split('.')

        new_patch_version = str(int(version_info[-1]) + 1)
        version_info[-1] = new_patch_version

        new_version_name = '.'.join(version_info)

        new_build_number = str(int(old_version_data[-1]) + 1)

        new_version_data = '+'.join([new_version_name, new_build_number])

        lines[i] = 'version: ' + new_version_data + '\n'

    newLines.append(lines[i])

new_yaml_file = open('pubspec.yaml', 'w')
new_yaml_file.writelines(newLines)
yaml_file.close()
new_yaml_file.close()
