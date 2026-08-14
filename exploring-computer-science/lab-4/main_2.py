def calScore(weights,max_scores,scores):
    result = 0
    for i in range(len(scores)):
        if(weights == []):
            a = (scores[i]/max_scores[i])*(100/len(scores))
            result += a
        else:
            a = (scores[i]/max_scores[i])*weights[i]
            result += a
    print(f"Final weighted score is {result:.2f}")
    
weights = [20,40,40]
max_scores = [50,40,80]
scores = [45,30,50]

calScore(weights,max_scores,scores)