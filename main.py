import sys
from antlr4 import *
from YaplLexer import YaplLexer
from YaplParser import YaplParser


def main(argv):
    input_stream = FileStream('test/arith.cl')
    lexer = YaplLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = YaplParser(stream)
    tree = parser.program()
    print(tree.toStringTree(recog=parser))


if __name__ == '__main__':
    main(sys.argv)
