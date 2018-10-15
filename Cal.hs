module Main
 where

import System.IO

main =do
	list<-doCal
	putStrLn ("The sum is " ++ show (foldr (+) 0 list))
	putStrLn ("The product is " ++ show (foldr (*) 1 list))
	showFactorials list

doCal =do
	hSetBuffering stdin LineBuffering
	putStrLn "Give me a number (or 0 to stop):"
	num <- getLine
	let number = read num
	if number==0
		then 
			return []
		else do 
			rest <-doCal
			return (number:rest)

showFactorials [] =return ()
showFactorials (x:xs)=do
	putStrLn (show (x) ++ " factorial is "++ show (fac x))
	showFactorials xs

fac 1=1
fac n=n*fac (n-1)