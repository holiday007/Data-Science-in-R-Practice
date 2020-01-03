Natural Language Processing Practice
================
Author: Holiday Tang  
[LinkeDin](https://www.linkedin.com/in/holiday-t/) |
[GitHub](https://github.com/holiday007) | [Kaggle
Novice](https://www.kaggle.com/holibae007)
Date: 2020-01-03

  - [Introduction to natural language
    processing](#introduction-to-natural-language-processing)

(Note: adopted from *Data Scicence and Machine Learning Bootcamp with R*
by *Jose Portilla* from Udemy)

# Introduction to natural language processing

Potential purpose:

  - Find relevant documents
  - Group articles by topic

We will want to:

  - compile documents
  - Featurize them
  - Compare their features

Featurization:

  - one option is based on **word counts**
  - use consine similarity on the vectors made to determine similarity:

  
![
sim(A,B) = cos(\\theta) = \\frac{A\\cdot B}{||A||\*||B||}
](https://latex.codecogs.com/png.latex?%0Asim%28A%2CB%29%20%3D%20cos%28%5Ctheta%29%20%3D%20%5Cfrac%7BA%5Ccdot%20B%7D%7B%7C%7CA%7C%7C%2A%7C%7CB%7C%7C%7D%0A
"
sim(A,B) = cos(\\theta) = \\frac{A\\cdot B}{||A||*||B||}
")  

We can improve on Bag of words by adjusting word counts based on their
frequency in corpus, the group of all documents.

We can use TF-IDF (Term Frequency-Inverse Document Frequency)

  - Term frequency - **Importance** of the term within that document
      - TF(d,t) = Number of occurences of term t in document d
  - Inverse document frequency - how important a word is to a document
    in a collection or corpus.
      - IDF(t) = log(D/t)
          - D = total number of documents
          - t = number of documents with the term
          - so for term x within document y

  
![
W\_{x,y} = tf\_{x,y} \\cdot log(N/df\_x)
](https://latex.codecogs.com/png.latex?%0AW_%7Bx%2Cy%7D%20%3D%20tf_%7Bx%2Cy%7D%20%5Ccdot%20log%28N%2Fdf_x%29%0A
"
W_{x,y} = tf_{x,y} \\cdot log(N/df_x)
")  

  - ![tf\_{x,y}](https://latex.codecogs.com/png.latex?tf_%7Bx%2Cy%7D
    "tf_{x,y}") - frequency of x in y
  - ![df\_x](https://latex.codecogs.com/png.latex?df_x "df_x") - number
    of documents containing x
  - N - total number of documents

The tf–idf value increases proportionally to the number of times a word
appears in the document and is offset by the number of documents in the
corpus that contain the word, which helps to adjust for the fact that
some words appear more frequently in general.

…package

""
