
import System.Environment
import System.IO
import Control.Monad
import System.Process
import Test.Benchmark.Function
import Control.Applicative
import Text.Printf


sequenceWhile pm [] = return ()
sequenceWhile pm (m:ms) = do 
                p <- pm 
                if p then m >> sequenceWhile pm ms
                     else return ()

main = do
       (x:xs) <- getArgs
       (_, Just hout, _, _) <-
          createProcess (proc x xs) {std_out = CreatePipe}
       sequenceWhile ( {- not <$> hIsEOF hout -} return True) $
         ((flip map) [1..] (\x -> do
          (line0,time0) <- timeAction $ hGetLine hout
          -- (line1,time1) <- timeAction $ hGetLine herror
          putStrLn $ show x ++ ":" ++  printf "%f" (time0) ++ ":" ++ line0))



