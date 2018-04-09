import ConfigParser

    
class Config(object):
    def __init__(self):
        pass


    def config_section(self, path, section):
        cf = ConfigParser.ConfigParser()
        cf.read(path)
        section_dict = {}
        for option in cf.options(section):
            section_dict[option] = cf.get(section, option)
        return section_dict


