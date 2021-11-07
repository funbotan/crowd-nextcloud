import sys
from passlib.hash import atlassian_pbkdf2_sha1

print(atlassian_pbkdf2_sha1.verify(sys.argv[1], sys.argv[2]))