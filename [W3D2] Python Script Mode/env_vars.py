
# Default values for env variables in .env file
# https://github.com/theskumar/python-dotenv

from dotenv import load_dotenv
load_dotenv()

import os
print(os.environ["HOLA2"])