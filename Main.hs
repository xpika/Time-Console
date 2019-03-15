
import System.Environment
import System.IO
import Control.Monad
import System.Process
import Control.Applicative
import Text.Printf
import Data.Time

sequenceWhileTrue [] = return ()
sequenceWhileTrue (m:ms) = do 
                r <- m 
                if r then m >> sequenceWhileTrue ms
                     else return ()

main = do
       (x:xs) <- getArgs
       hSetBuffering stdout NoBuffering
       (_, Just hout, _, _) <-
          createProcess (proc x xs) {std_out = CreatePipe}
       hSetBuffering hout NoBuffering
       sequenceWhileTrue $
         ((flip map) [1..] (\x -> do
          ((more,line0),time0) <- timeAction $ do 
                                              more <-  not <$> hIsEOF hout  
                                              if more then do 
                                                           hout' <- hGetLine hout
                                                           return (more,hout')
                                                      else return (more,"")
          when more (putStrLn $ show x ++ ":" ++  printf "%f" (time0) ++ ":" ++ line0)
          return more))

timeAction action = do
    t1 <- getCurrentTime
    g <- action
    t2 <- getCurrentTime
    let timeInUnits = (realToFrac $ diffUTCTime t2 t1 :: Float)
    return (g,timeInUnits)
