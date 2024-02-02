forge coverage --report lcov --mp "test/modules/**/*.t.sol"

lcov --remove ./lcov.info -o ./lcov.info.pruned '/test/**/*' 'test/**/*' '/script/**/*' 'script/**/*'

genhtml lcov.info.pruned --output-directory coverage

open coverage/index.html