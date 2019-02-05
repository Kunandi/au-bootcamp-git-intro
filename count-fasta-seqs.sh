#!/bin/sh

# How this script should behave:
#
# INPUT:   Paths to one or more fasta sequence files
#
# OUTPUT:  For each file, it should write a line with the number of sequences
#          in the file, a space, and then the file NAME (NOT the path!), and a
#          final line with the total number of sequences across all files.
#
# EXAMPLE: In the same directory as this script, you should find an example
#          fasta file named 'example-seqs1.fasta', which contains:
#
#          >RMB3263_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#          
#          >CWL052_Cyrtodactylus_philippinicus_Negros
#          CGGGCCCATACCCCGAAAATGTTGGTATAAACCCCTTCCTATACTAATAAACCCCATTATTTGATCACTATTACTAAC
#
#          If you run this script on this fasta file, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta
#          2 example-seqs1.fasta
#          2
#
#          There should be another example fasta file named
#          'example-seqs2.fasta', which contains:
#
#          >RMB7155_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7156_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#          
#          >RMB7163_Sphenomorphus_arborens_Negros
#          ATGAACCCCATTATAACCTCCCTCATTTTATCAAGCCTGGCCCTTGGAACCGTAATCACACTAACAAGCTACCACTGA
#
#          If you run this script on BOTH fasta files, you want to get the
#          following output:          
#
#          $ sh count-fasta-seqs.sh example-seqs1.fasta example-seqs2.fasta
#          2 example-seqs1.fasta
#          3 example-seqs2.fasta
#          5
#
#
# Your goal is to work collaboratively with ~ 3 other people to edit this
# script until it passes all the tests that have been written for it. I.e., you
# should be able to run:
#
#   $ sh run_tests.sh
#
# and see 'All tests passed!' at the bottom of the output.
#
# To do this, one member of your group should fork this repository, and add the
# other members as collaborators, so that all members of the team can be
# pulling and pushing changes to the script to the collaborative remote
# repository on Github.
#
# HINTS
# The first thing you need to be able to do is access the paths to the fasta
# files that were 'given to' this script. The variable "$@" will be very useful
# for this. Let's take a look at what it gives us:

#echo "$@"

# How are you going to work with each file path?
# HINT: for loop (remember "for do done"?)
#
# To get the name of each file from the path, checkout the command 'basename':
#
#   $ man basename
#
# To count the number of sequences in each file, I recommend you checkout
# 'grep' and 'wc':
#
#   $ man grep 
#   $ man wc 
#
# WARNING about 'grep': ALWAYS quote the string that you are trying to find!
# For example, do:
#
#   $ grep "string I want to find" file-i-want-to-find-it-in.txt
#   **NOT**
#   $ grep string I want to find file-i-want-to-find-it-in.txt # DON'T DO THIS!
#
# To keep a tally of the total number of sequences across all files, 'expr'
# might be useful:
#
#   $ man expr 
#
# Good luck!
#
# ADD YOUR CODE BELOW:

# JAKE PUSHED FIRST!  HE DECLARES WAR ON ALL OTHER MEMBERS OF THIS GROUP!
# JAKE PUSHES AGAIN!  A SECOND STRIKE!  
# Iwo: This is really cool. I'm a bit rusty on for loops, and everything else.
# Iwo: I'll review some things today, but probably won't be able to put much
# effort into this until tomorrow
# A wild Rattata appears!
#KC: Loving the pokemon, going to be working this today :)
#Golduck, go!

#Commenting this out
#sh run_tests.sh

#Rattata: ran this as a test..
#...who would choose Rattata?  Are you going for an r-selected attack-approach?
#wc -l  "$1"
#wc -l  "$2"

#This works but should be in loop form, and not sure how to get the file name on the same line as the grep output?
#grep -c ">" "$1" && echo "$1"
#grep -c ">" "$2" && echo "$2" 

#echo "This is the output that Scott and Jamie want.  See?  It's right there in the first sentence.  We can all go home."

#cwd=$(pwd)

#This doesn't yet appear to capture more than one file--what are you aiming for with these, in specific?  (So we can work together!)
#for cwd in "$@"
#do 
#	grep -c ">" "$@" && echo "$@"
#done

#I've commented those out in order to try another way--see below!

#This is still afunctional, but I think we need to include both filenames in the for-loop.
#for args in example-seqs1.fasta example-seqs2.fasta
#do
#	grep -c ">" "$@" && echo "$@"
#doe

# So then does "$@" refer to the paths for all files listed after the executable "sh" and this script file?
# I am confused by Jamie's example output, the first line of which resembles an input 


##Anna's trial, I have hashed out the above semi-working script
#for FILE in "$@"
#do

#	grep -c ">" "$@" && basename -a "$@" > "$@".txt
#	
#done
##This script will work as well as previous, but it stil double repeats the information which i beleive is part of the usage of $@, i beleive there is another way, but unfortunately 
##I cant remember, it also still does not total up the numbers as desried or output the information in the orientation he wants, this seems to be a built in portion of grep -c when multiple
##files are referenced, i cant think of a way to total up the numbers with out setting variables as we go, but since the only option we have for referencing the file is $@ that wont work either
## Anna H comments

##This will work but not how they want
#for FILE in *.fasta
#do
#	grep -c ">" $FILE && echo $FILE
#done

#Iwo takes a whack.
#I can't figure out how to compute the expr line.
#Fixed a small error
for i in "$@"
do grep -c ">" $i && basename --suffix=.fasta $i
done

