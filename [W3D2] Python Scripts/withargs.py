#https://docs.python.org/3/library/argparse.html
import argparse
from calc import suma

parser = argparse.ArgumentParser(description='Process some integers.')

parser.add_argument('--el1', dest='el1', default=5, type=int,
                    help='the first element to sum')
parser.add_argument('--el2', dest='el2', default=10, type=int,
                    help='the second element to sum')

args = parser.parse_args()
print(args.el1, args.el2)
print(suma(args.el1, args.el2))