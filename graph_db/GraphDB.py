import os
from neo4j import GraphDatabase

USERNAME = "neo4j"
PASSWORD = os.getenv("DBA")
URI = "neo4j+s://0ceece16.databases.neo4j.io"
AUTH = (USERNAME, PASSWORD)
FILES = {"create_db": "create.cypher", "delete_db": "delete.cypher"}

class GraphDB:
    def __init__(self):
        self.driver = GraphDatabase.driver(URI, auth=AUTH)

    def run_cypher_query(self, cypher_query):
        with self.driver.session() as session:
            result = session.run(cypher_query)
            return result

    def run_cypher_file(self, cypher_file):
        # Open and read the .cypher file
        with open(cypher_file, 'r') as file:
            cypher_query = file.read()
            
        return self.run_cypher_query(cypher_query)
    
    def close_connection(self):
        self.driver.close()
        
    

if __name__ == '__main__':
    graph_db = GraphDB()
    graph_db.run_cypher_file(FILES["delete_db"])
    #graph_db.run_cypher_query()
    graph_db.close_connection()
    
