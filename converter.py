import os
import sys
import argparse

# converts an SQLite file to T-SQL
class Converter:
    def __init__(self, path) -> None:
        self.path = path
        self.converted = ""
        self.tables = {}
        self.edges = {}
        self.convert()

    def convert(self):
        # firstly, convert the schema into t-sql format, add AS NODE to the end of each table, add tables to self.tables
        self.convert_file()
        # then, add AS NODE to the end of table definitions
        # also add these to self.tables and track primary/foreign keys on the way
        self.initialise_nodes()
        # then, add edges tables for all possible relations between tables
        self.add_edge_tables()
        #then, for each of the primary and foreign keys, add an insert edge between them
        self.insert_edges()
        # then write the final output to path_converted.txt
        self.write_output()
    
    def convert_file(self):
        fp = open(self.path, "r")
        contents = fp.readlines()
        fp.close()
        for line in contents:
            line = line.strip()
            # replace backticks with "
            line = line.replace('`', '"')
            # if line is beginning of table declaration
            # add table name to self.tables and its fields too
            # convert datatypes e.g text to VARCHAR(100)
            split_line = line.split()
            if split_line[0] == "CREATE":
                pass
            # if line is beginning of insert statmement, convert it from INSERT INTO <table> VALUES (val_col_0, val_col_1, …, val_col_n), which looks like this: INSERT INTO  "battle" VALUES (1,"Battle of Adrianople","14 April 1205","Kaloyan","Baldwin I","Bulgarian victory"); into INSERT INTO <table> VALUES (1, <val_0>), (2, <val_1>), …, (n, <val_n>)
            elif split_line[0] == "INSERT":
                pass

    def initialise_nodes(self):
        pass

    def add_edge_tables(self):
        pass

    def insert_edges(self):
        pass

    def write_output(self):
        pass

# process command line arguments
# returns: args - namespace of command line arguments
def process_args():
    
    parser = argparse.ArgumentParser()
    parser.add_argument("file_flag", type=int, choices=[0, 1], help="0 for converting a single file, 1 for a whole directory")
    parser.add_argument("path", type=str, help="If single file, the path to that file. If directory, the path to that directory.")
    args = parser.parse_args()

    if args.file_flag == 0:
        if not os.path.isfile(args.path):
            raise Exception("Given file path is not valid.")
    else:
        if not os.path.isdir(args.path):
            raise Exception("Given directory path is not valid.")

    return args

def main():
    args = process_args()
    if args.file_flag == 0:
        c = Converter(args.path)
    else:
        for root, dirs, files in os.walk(args.path):
            for name in files:
                print(os.path.join(root, name))
            for name in dirs:
                print(os.path.join(root, name))

if __name__ == "__main__":
    main()

# def get_output_file_name(schema_file_name):
#     completed = False
#     i = 0
#     while not completed:
#         possible = f"{schema_file_name}_converted_{i}.txt"
#         if not os.path.isfile(possible):
#             return possible
#         i += 1

# # left unfinished with comments, going to just make a basic table by hand to see if the graph stuff is possible first
# def fix_schema(schema_file_name):

#     # <table_name>: [col0name, col1name, ..., colNname]
#     tables = {}
#     output_file_name = get_output_file_name(schema_file_name)

#     fp = open("schema.sql", "r")
#     contents = fp.readlines()
#     fp.close()

#     fp = open(output_file_name, "x")
#     for line in contents:
#         line = line.strip()
#         # replace backticks with double quotes
#         line = line.replace("`", '"')
#         # if its a table, add it to our table and column dict

#         # otherwise if its an insert, change it from from INSERT INTO <table> VALUES (val_col_0, val_col_1, …, val_col_n) into INSERT INTO <table> VALUES (<col_0_name>, <val_0>), (<col_1_name>, <val_1>), …, (<col_n_name>, <val_n>) by using the tables dict
 
#     fp.close()