from urllib import request
from project import Project
import toml


class ProjectReader:
    def __init__(self, url):
        self._url = url

    def get_project(self):
        # tiedoston merkkijonomuotoinen sisältö
        content = request.urlopen(self._url).read().decode("utf-8")
        #print(content)

        # deserialisoi TOML-formaatissa oleva merkkijono ja muodosta Project-olio sen tietojen perusteella
        deserialised = toml.loads(content)
        #print(deserialised)
        #print(deserialised["tool"]["poetry"]["name"])
        name = deserialised["tool"]["poetry"]["name"]
        description = deserialised["tool"]["poetry"]["description"]
        license = deserialised["tool"]["poetry"]["license"]
        authors = deserialised["tool"]["poetry"]["authors"]
        dependencies = deserialised["tool"]["poetry"]["dependencies"]
        devpendencies = deserialised["tool"]["poetry"]["group"]["dev"]["dependencies"]
        return Project(name, description, license, authors, dependencies, devpendencies)
