
import os
from calc import suma
import sys
from dotenv import load_dotenv
load_dotenv()

# try:
#     import sentry_sdk
#     sentry_sdk.init(os.environ["SENTRY_URL"])
# except:
#     print("Missing sentry config")
#     sys.exit(-1)    



def getFrom(l,i,_default):

    if type(_default) != int:
        raise ValueError("_default must be an integer")

    # try:
    #     int(_default)
    # except Exception:
    #     print("Invalid default value, must be integer")
    #     raise ValueError("_default must be an integer")

    if i < len(l):
        return l[i]
    else:
        print("Using default value: {}".format(_default))
        return _default


def main():
    #try:
    a = int(getFrom(sys.argv,1,'a'))
    b = int(getFrom(sys.argv,2,5))
    # except Exception as e:
    #     print("Tienes que pasarme dos enteros")
    #     print(e, type(e))
    #     return

    print(suma(a,b))
    print(sys.argv)

if __name__ == "__main__":
    main()