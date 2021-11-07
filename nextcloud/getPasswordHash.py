import sys
from passlib.hash import atlassian_pbkdf2_sha1

print(atlassian_pbkdf2_sha1.hash(sys.argv[1]))