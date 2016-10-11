A Shiny App to predict next word - Capstone Project
========================================================
author: Kun Zhu
date: 10/09/2016

Summary
========================================================

- The purpose of this Shiny app is predict next word(s) given a input text string. 
- The predictive model is built based on datasets offered by this capstone course. Specially, the data are from blogs, news, and twitter collected by HC Corpora. 
- Necessary cleasing are performed on the input dataset. The cleaning actions includes: removing punctuations, white spaces, numbers and swear words (download swearWords.txt from http://www.bannedwordlist.com/) together with coverting text to lowecase.


How to use this Shiny app
========================================================
Simply type a sentence or a word, the app will return a list of ten words from prediction. The prediction results are presented in a drop down list allowing user to select. In addition to the prediction results, a message window indicating the prediction based on which ngram is also availble in the screen. In case the predictive model cannot return a valid word, the ten most frequent single words are returen instead. This is also indicated in the message window.


Under the hood
========================================================

The input text string is processed and tokenized. The processed text string is searched using the quagram dataset. If there is a match, it wil be returned to the user. The maximum number of matches retured are ten. In case, there is no match, the algorithm moved on to search trigram dataset instead. This is an iterative process until bigram is searched. When there is no match, the algoritm return the ten most frequent words in the dataset. 

Summary and comments
========================================================

- The user interface is simply and intuitive. 
- Comparing some of the classmate's app, this app is actually very responsive.
