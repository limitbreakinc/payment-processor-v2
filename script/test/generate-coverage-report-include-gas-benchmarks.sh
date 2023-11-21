forge coverage --report lcov

lcov --remove ./lcov.info -o ./lcov.info.pruned '/test/**/*' 'test/**/*' '/script/**/*' 'script/**/*'

genhtml lcov.info.pruned --output-directory coverage

open coverage/index.html