#!/usr/bin/python3
import sys,argparse

##########################################################################
##########################################################################

def main2(options):
    with open(options.input_path,'rb') as f: data=f.read()

    index=options.table_addr&0x3fff
    table=data[index:index+86]

    def gp(value):
        if value>=33 and value<=126: return chr(value)
        else: return ' '

    for i,x in enumerate(table):
        xm=x^0x5b
        print('| $%04x | %3u | %3u 0x%02x | %3u 0x%02x %s |'%(options.table_addr+i,i,x,x,xm,xm,gp(xm)))
    
##########################################################################
##########################################################################

def auto_int(x): return int(x,0)
        
def main(argv):
    parser=argparse.ArgumentParser()
    parser.add_argument('-a',dest='table_addr',default=0xb09e,type=auto_int,metavar='ADDR',help='''treat %(metavar)s as table address. Default: 0x%(default)x''')
    parser.add_argument('input_path',metavar='FILE',help='''read input from %(metavar)s''')
    main2(parser.parse_args(argv))

##########################################################################
##########################################################################

if __name__=='__main__': main(sys.argv[1:])
