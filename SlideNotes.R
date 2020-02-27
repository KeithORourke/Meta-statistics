# https://github.com/KeithORourke
# Seattle mtg 9 (good)

 
# C:\Users\k_oro\Documents\TFSRAaudio
# "C:\\clone\\TFSRAaudio"
tdir <- "C:\\Users\\k_oro\\Documents\\TFSRAaudio"
tfile <- file.path(tdir, "myWave.wav")
tfile
writeWave(vec, filename = tfile)
list.files(tdir, pattern = "\\.wav$")

slides <- names(narateTxt)


foo <- function(x){
  vec <- synthesize(narateTxt[x][[1]], voice = "Amy") #Amy, Emma, Brian
  tfile <- file.path(tdir, paste0(x,".wav"))
  writeWave(vec, filename = tfile)
}

sapply(slides,foo)


narateTxt <- list()

narateTxt$Slide1 <- "Slide 1. What statistics can and should be to enable scientifically trustworthy analysis. 

The purpose of my talk today is primarily to get across a concise and not too wrong sense of how statistics should inform scientific inquiry. This will require me to give some sense of what I understand as profitable inquiry in science. That is exactly what statistics should be supporting - scientifically trustworthy analysis. Something like scientific inquiry preliminaries for statistics. Or borrowing a garish phrase from a personalised medicine paper – ensuring scientific wellness in the application of statistical methods.  

Paraphrasing Susan Haack, scientific inquiry is continuous with everyday empirical inquiry, but enormously refined and amplified by specialized tools and techniques. It's hard for those outside the relevant field fully to understand, given they are unfamiliar with those tools and techniques and with the technical vocabulary that necessarily evolves. A vocabulary that can be at best superficially understood by someone who lacks real knowledge of the subject-matter. Especially so in statistics. 

Recall an early motto of science was take no one's word for it. Taking this to heart, it would arguably be better if most scientists and reviewers did not have to take the word of a statistical expert. Going along with assurances to use a particular method of analysis that will supposedly extract all the credible results of your study. Just the credible results, nothing more - just take my word for it.  

Our job in science is to make sense of our observations. Simply put, science is thinking, observing and then making sense of thinking and observing for some purpose. But, put on steroids by repeatedly cycling through these 3 over and over again and sharing some iterations of all 3 widely to learn in what ways you are wrong. In order to share all 3, thinking is formalized as representations that encode assumptions about reality, observing is formalised in instructions for re-observing under the same conditions, while sense making is formalised in assessments of what would repeatedly happen in some reality or possible world. That is if the sense making was not too wrong. 

Apparently in the UK, some clinical researchers regularly hire 3 statisticians to analyse their studies separately and then only report the most publishable of the purported results. The opposite of profitable inquiry.

Disclaimer: this is just my deliberation on dealing with uncertainties in scientific inquiry and should not be attributed to any entity other than me. As with any critically-thinking inquirer, the views behind these deliberations are always subject to rethinking and revision at any time. For instance, each time I have given this type of talk my views do change. Hopefully getting less rather than more wrong. And I am trying out using Amazon text to voice to read my notes while remaining attentive to non-verbal feedback in the room."




narateTxt$Slide2 <- "Slide 2. Background.

The first item on this slide is just to provide some authority for me claiming to be expressing informed views on statistics, inclusive of Bayesian methods. I am surprised and grateful that a number of faculty from Duke continue to provide advice on Bayesian methods whenever I have asked. 

Then there are my two kicks at providing instruction on Bayesian methods to reviewers in XX. In total, I spent almost 100 hours putting the first course together and revising the second. Most of that on evenings and weekends. The course descriptions were well received - as the quoted comment indicates. A related abstract was entitled perceptive simulation (smart Monte Carlo) as the basis for understanding, implementing and evaluating Bayesian analysis in a regulatory setting. 

Perhaps most fortunately for me, through the adaptive design working group, chaired by YYYY in 2011. I got to see how some were putting what they took away from the courses in their work. For the most part, not at all what I was trying to actually get across. Maybe even did more harm than good. As Neil deGrasse Tyson put it, the challenge of learning enough to think you are right. Versus enough to know you are wrong. 

However, I have given a few external webinars and seminars for societies, a Canadian School for Public Servants enabled Bayesian self learning course and a Shopify invited talk since then. Perhaps more relevant, I recently did internal lunch and learns at XXXX for the evaluators. Repeatedly trying to address the deficiencies. 

Think I now can do better."


narateTxt$Slide3 <- "Slide 3. Distinguish three grades of clarity of concepts in science. 

It might be worthwhile to consider three grades of clarity of concepts in science – being able to recognise occurrences, being able to provide an explicit formal definition and knowing what to make of it, in an ongoing, open ended way.

Take the so called simple p-value. There is a widely agreed upon, technically correct definition by most experts. Now, most if not all these experts, misstate if not also misunderstand the definition at some point in their careers. Lots of documented cases in the literature. When I had to teach it at Duke, I avoided repeating it too often, fearing if I got it wrong just once – that wrong one would be copied down by some students and shared widely. I will skip it here, but the definition will emerge, hopefully more naturally, later in my talk. 

Recognition is tricky – what is required for a valid p-value can be very strict or casual. A strict requirement being that if there is really no effect (or some specified effect to rule out) the distribution of p-values needs to be distributed uniformly between 0 and 1. As this will almost never happen for non-randomised studies, maybe p-values from those should be called psuedo-p-values. Not everyone agrees.   

That no one can say exactly what to make of a p-value from a given study perhaps should not be too surprising. At least when its realised that it needs to be open ended. As one learns more about how a study was actually done, or even learns results of very similar studies, the reported p-value should be interpreted differently.  A technical phrase for what is required would be discernible uberty - fertile growth and fruitfulness of interpretation."

narateTxt$Slide4 <- "Slide 4. Instead of new methods – how to think about methods.

Rather than suggesting any new statistical methods, I will focus mainly on how to think and talk about familiar methods. 

If sensibly done, these considerations will naturally lead from p-values to providing confidence intervals in a straightforward manner. That is, recycling the p-value to avoid unnecessary introduction of new material in order to get confidence intervals. 

Also, giving away the punch line somewhat, by generalizing how to interpret both p-values and confidence intervals, I will then provide a rigorous introduction to Bayesian methods. This will all be done without any mathematical formulas. To avoid the formulas, I will have to first explain how to define, grasp and work with probability models without formulas. Key in this will be getting across a clear and concise understanding of statistical simulation. Now, with a good grasp of statistical simulation, the preceding claims will not seem so ambitious.

A key unifying concept overall will be compatibility and its use in informing what to make of p-values. Compatibility being taken as a state of observations and assumed expectations occurring together without conflict. As will be argued for, something observed is considered most compatible if observations are exactly as expected and less and less compatible as observations are less and less as expected. The term for confidence intervals will be changed to compatibility intervals to reflect this central importance. My talk is all about compatibilities and compatibilities all the way down.

So an outline summary of my talk being, metaphors, probability models, simulations, abstract fake universes (to be elaborated), what to make of p-values, compatibility intervals and then onto Bayes and beyond!"



narateTxt$Slide5 <- "Slide 5. Statistics: major harms as well as benefits

The harms of misunderstanding and misuse of statistics are becoming more apparent and widely discussed. For instance, Nature’s March 2019 editorial accompanying a commentary on retiring statistical significance put it this way - Looking beyond a much used and abused measure – statistical significance - would make science harder, but better. Now, the commentary mainly addressed one particular problem as the editors had insisted on a strict page limitation, restricted the authorship to a maximum of three and edited the final copy. And also I believe, changed the title to Scientists rise up against statistical significance. Arguably, the original retire statistical significance title was more apt - being retired is not the same as being banned or deported. 

Perhaps a large part of the problem is a confusion between being able to correctly do the statistical calculations with understanding what they represent. And especially what to make of them. The same is true of a confusion between being able to correctly do the proofs of the theory versus understanding what the theory represents and how to apply it in actual studies. I don’t think anyone has been widely convincing on how to provide graduate level instruction that avoids these pit falls. 

I am trying to do some of that today by using metaphors, diagrams and motivated simulations to provide stop frame animations of the diagrams instead of formula math. In particular, I will be using shadow, analytical chemistry and probability model metaphors."

narateTxt$Slide6 <- "Slide 6. Learning from shadows as a metaphor for statistics.

Think of learning about an object - just from the shadows it casts - while being unable to look directly at the object. 

We see those shadows but really are only interested in what is actually casting them.

In statistics, observed samples are shadows but we are really interested in how they would repeatedly occur in the future (get some sense of what casts them and will generalise  - science!).

That is we want to discern some sense of how the observations were generated and ended up in our possession and make that explicit as possible in order to better understand it."


narateTxt$Slide7 <- "Slide 7. Analytical chemistry as a metaphor for statistics.

Various machine readings are made of a chemical present, say in water in a test tube, that has been spiked with an exactly known amount. 

How do the noisy machine readings (e.g. Direct Fourier Transform InfraRed spectroscopy?) relate to the spiked amount known to be present, which again usually cannot be directly seen or measured?

The machines readings are the shadows here and the actual amount in the test tube is of interest – how are they repeatedly related - machine readings to known spiked amount? 

By repeatedly doing this with differing amounts, one can get a sense of compatibilities between readings and a spiked amount. The more frequent readings being more compatible with that spiked amount, less frequent less compatible."



narateTxt$Slide8 <- "Slide 8. Scientific statistics is not analytic chemistry.

No one can simply spike a known yearly cancer mortality rate in say rats. 

So we must make abstract representations of such possible realities - these are just fake universes with set cancer mortality rates - abstract fake universes. 

My perception is impacted by Reality which impacts Your perception 
(Notice arrows go only one way to each of us separately).

My (your) perception of reality is just recast as an idealized abstract representation in our heads of what to expect and how to act. Those abstract representation can be cast in diagrams or prose so they can be shared and criticized. 

Importantly perceptions of reality should reflect what we think repeatedly would happen in setting X. 
Often referred to in science as replication – what replicates is really just a sequence of shadows of reality."



narateTxt$Slide9 <- "Slide 9. Similarly the finite population survey sample view of statistics is misleading.

Sampling from a finite population (e.g. survey sampling), is often used to explain statistical inference. 

Here like in analytical chemistry, we could spike the percent of defects in a finite population (or learn it in a census).

Unfortunately, as K. Rothman has argued, this view creates a naive statistical intuition that scientific generalization involves the mechanical extrapolation of results from a sample to its source population. But that describes statistical generalization; scientific generalization is different: it is the process of constructing a correct statement about the way nature works.

Ideally we want to know something about how cancer mortality occurs to better predict it. That is, we should strive for informed purposeful extrapolation. 

Admittedly, we have no choice but to settle with just the hope that our predictive model is actually somehow connected to how reality works.
"


narateTxt$Slide10 <- "Side 10. Need for abstract fake universes in statistics and science in general. 

Allows my and your perceptions of reality to be made external and precise. 

That is subject to review, criticism and revision by ourselves and others.

Also we have to be abstract in order to be general - to go beyond what happened this particular time. 
However, an abstraction is just a way to represent that reality which is beyond direct access.

So an abstract model needs to not be confused with the reality it just attempts to represent, in some meaningful way for some purpose. 

Because of this, I am talking about abstract models as metaphors and in particular probability models as metaphors rather than assumptions that sometimes are suggested to be testable. Again there is no direct access to reality to check this. 

The veracity of any statistical method depends on an implicit abstract fake universe being not too wrong."


narateTxt$Slide11 <- "Slide 11. Probability models need to be adequately grasped as a metaphor.

The most common tool for working with abstract representations is math. And in many ways it is the best way - but only if adequately grasped (as opposed to doing the calculations correctly).

In statistics it's usually probability math so it is very hard math indeed.

However, one definition of math is the manipulation of diagrams or symbols taken beyond doubt to be true - experiments performed on abstract objects rather than chemicals. 

From a Nineteenth century Chemist, CS Purse - Operations upon diagrams, whether external or imaginary, take the place of the experiments upon real things that one performs in chemical and physical research.

Now, by defining probability models as diagrams to be experimented upon, we can replace the math with motivated simulations given today's computational power. In particular, we will need to use probability models as data generating models (a process that repeatedly produces data like we have observed) and fake reality generating models (a process that repeatedly sets say known cancer rates). With these, we can repeatedly animate what would be observed in the different abstract fake universes we make"

narateTxt$Slide12 <- "Slide 12. Probability models defined faithfully with two diagrams.

Two distinct types of probability - discrete and continuous.

In the right graph, discrete: A stick of length one, which is broken into pieces of various lengths that represent the relative frequency of an outcome occuring and only placed over outcomes that can occur. 

Outcomes could be univariate or multivariate where pieces just get very small simply because as the number of possible outcomes increases, the probabilities still must add to one.


In the left graph, continuous: A square of area one, which can be shifted, stretched and reshaped in any way that does not change the total area of one. 

The area of the resulting curve below a given interval the represents the relative frequency of an outcome occuring within that interval.

Outcomes could be univariate or multivariate - using cubes and hyper-cubes of total volume one.

"

narateTxt$Slide13 <- "Slide 13. Statistical simulation as a means to learn about probability models.

Statistical simulation allows one to skip the math but needs random numbers to power it. 

Hence the generation of random numbers needs to be well understood and it's clearest to see how to exactly get these using digits of Pi. 

Digits of Pi go on forever with (as of yet) no detected pattern - 12 trillion checked so far. 

So take say the time in seconds right now on a computer clock and just keep the first 4 decimal places for seconds.

Now start at that digit of Pi (say 46893) take a chunk of 4 digits (46893to 46896), divide by 10000, repeat for the next 4 digits and so on. 

Those will uniformly cover the interval between 0 and 1 - haphazardly.

That is they will be as close as humanly possible to being random draw from the Uniform 0 1 distribution (physicists still argue if true randomness ever happens).

Taking two at a time (as say x and y) that will then uniformly cover the unit square. K at a time will uniformly fill the hyper-cube." 

narateTxt$Slide14 <- "Slide 14. Getting samples from any particular distribution. 

We need random samples for any distribution we can define but we can get these from uniformly distributed ones.

On the right, any particular discrete distribution can be obtained from uniform random numbers by carving up the interval and returning the outcome J only if draw is in that particular interval J. That J will be a random number drawn from that particular discrete distribution.

On the left, any particular continuous distribution can be obtained from pairs uniform random numbers by first choosing a probability density curve and shifting and stretching the two digit uniform rectangle to cover almost all of the probability curve. For any member of the pair that falls below the curve, keep the first member of the pair or esle dicard. That first member of the pair kept will be a sample from thatany particular continuous distribution.

Something very similar is done for generating multi-variate random samples.

Done simply and ideally (except for computational efficiency it cannot be done with more validity)."

narateTxt$Slide15 <- "Slide 15. Enables repeatedly experimenting on abstract probability model diagrams.

Here it is suggested to take advantage of experimental thinking and recent increases in computational resources to avoid formal or math based expositions of p_values. Statistical simulation enables the experiments which are carried out on abstractions. 

But it needs to be made clear what is meant by abstractions and why they are absolutely essential for understanding p-values (or most other statistical concepts).  It also needs to be made clear how experiments can be done on abstractions and especially how this is actually math without the need for formulas. 

Also, the sense of an abstract model or representation needs to not to be confused with reality. As Leonard Cohen put it, there is the word butterfly and the butterfly. If you confuse the two – people have the right to laugh at you. 

Metaphors seem like a good way to do this – transport an understanding from something familiar to obscure or difficult to grasp subjects."

narateTxt$Slide16 <- "Slide 16. Making abstract fake universes (with set cancer mortalities) to see what repeatedly happens.

"

narateTxt$Slide17 <- "Slide 17. Plot the set of abstract fake universes.

"

narateTxt$Slide18 <- "Slide 18. Discerning what to make of reality that produced observation in abstract fake universes. 

To make it concrete, in a sample of 9 rats 3 had cancer at 104 weeks on autopsy.
We are worried about high rates of cancer - what does 3/9 mean.
Ok in a abstract fake universe we made it to have a 50% rate, is observing 3 out of 9 compatible with that abstract fake universe?
Would 3 or less often occur in the abstract fake universe?
Do this for all abstract fake universes to say 2 decimal places.

"

narateTxt$Slide19 <- "Slide 19. Focus on the abstract fake universe with 50% return rate. 

To make it concrete, in a sample of 9 rats 3 had cancer at 104 weeks on autopsy. How compatible is this observed rate to a possibly true rate of 50%?

This plot is just for that abstract fake universe.

We are worried about high rates of cancer - what does 3/9 mean.

Is observing 3 out of 9 compatible with that abstract fake universe?

Would 3 or less often occur in this abstract fake universe?


Now do this for all abstract fake universes to say 2 decimal places.
"

narateTxt$Slide20 <- "Slide 20. Plot assessed compatibilities of all rates (to 2 digits) for 3/9 as a curve. 

"

narateTxt$Slide21 <- "Slide 21. What has been accomplished.

Given some observations, their compatibility with each abstract fake universe has been assessed - separately. 

Each and every abstract fake universe is taken to be an island on its own and equally sensible for our universe.

That was done using simulation to simply assess in each separately, how often something as discrepant or more discrepant would repeatedly happen in that abstract fake universe (i.e. given assumptions used in that assessment).

Now the generally accepted formal definition of a p value how often something as discrepant or more discrepant would repeatedly happen given all the assumptions are exactly correct and is the effect is exactly 0 (or some other targeted amount). 

So are assessments above have been approximations of p values with the true rates in each abstract fake universe targeting rates of exactly that amount. 

The abstract fake universe are differentially compatible with the observations, the assumptions common to all abstract fake universes given their true rates differ.

Perhaps the observations are not from any universe that had true rates where observations as discrepant or more rarely happen?

Or other assumptions of abstract fake universe are not like our universe? 

Rule of thumb, if you have observations from an ideal RCT, judge the first otherwise more likely the second.

"

narateTxt$Slide22 <- "Slide 22. Two changes in practice that would reflect what was learned in above slide. 

Interpret p-values not as a probability in any sense, but rather assessments of compatibility between observations, a specified effect (usually 0) and all the assumptions. 

Smaller p-values assess the compatibility of the specified effect or the assumptions or both as being lower. Both are being called into question with judgment required for which called into question the most. 

Repeat this compatibility assessment for all of the effects sizes and display those compatibilities in a plot to highlight all the effect sizes that should be questioned and which the most.

"

narateTxt$Slide23 <- "Slide 23. Some abstract fake universes (e.g. rates of cancer) are good bets to NOT be like our reality at all. 

Why not down weight the suspected unrealistic abstract fake universes?

Perhaps use background knowledge of relative rates of similar cancers in past studies.

Most rates above say 100 or 90 or 20 per cent would seldom occur in these say high mortality cancers?

One idea is that in repeated analyses of high mortality cancer “like this cancer”, that would be done, this is sort of the frequency which  various mortality rates will actually be encountered.

Another is it’s just an expert's sense of plausibility of the various rates expressed as a probability.

The assessments would always be the same. 

Now, as very one is always fallible about empirical claims really low frequencies/plausibilities.

"

narateTxt$Slide24 <- "Slide 24. One versus two stage simulation to generate abstract fake universes. 

To review unweighted abstract fake universes previously discussed:
For each and every rate, set the abstract fake universe to have that rate, repeatedly simulate using that rate and tabulate the counts within the abstract fake universes separately. Involves one stage of simulation and capatibility assessments within a given abstract fake universes.

Weighted abstract fake universes (being suggested now):
Rather that set the rate in an abstract fake universe, sample the rate randomly within with probabilities set equal to relative frequency or plausibility discerned. 

Then simulate fake data using that rate in abstract fake universe it corresponds to. Two stages, randomly sample which abstract fake universe to sample from and then sample fake observations in that universe. 

Here if we were to assess compatibility within abstract fake universes separately we would just get the same assessemnts as before but based on unequal number of samples from each abstract fake universe.

Hence we have to change the definition of compatibility. We do that by keeping only the draws of rates and fake observations where the fake observations equaled the one observed in our universe.

To summarize for now: repeatedly sample the fake rate (1) and then sample fake count (2), only keeping the rate and fake count when it equaled the count. Then tabulate counts of fake rates over all fake universes. Those fake rates that occur more frequently here and more compatible and those less frequently less compatible.

Notation: S(fake rate) then S(fake count given fake rate) and keep fake rate and fake count if fake count = count.

"

narateTxt$Slide25 <- "Slide 25. Mor on redefining compatibility in weighted abstract fake universes. 

Points in the full set of abstract fake universes generated that are most compatible with our reality – match the rate of cancer exactly (or more generally to some tolerance).

That set of fake rates “suggests” the parameters in those abstract fake universes are reasonable for our universe.

They produced the same count so just keep them all. Some occur more frequently and hence are more compatible with count and assumptions making up the abstract fake universes.  

All fake rates came from S(Fake Rate) then S(Fake Count given Fake Rate) and produce joint distribution or sample S(Fake Rate, Fake Count).

Select just those fake rates (as individual occurances) that generated fake count equal to the count we observed in our reality.

Notation: S(Fake Rate given Fake Count = Count) 

Which is S(Rate, Count; given Fake Count = Count).

"

narateTxt$Slide26 <- "Slide 26. Further details (actually the punch line).

S(Rate given Count) has N points (simulation).
S(Rate, Count given Count = Obs.) has p*N.
S(Rate, Count given Count = Obs.)/p*N will be a bonefide discrete probability model (earlier).
So change S to P (only two letters apart). 
P(Rate, Count; given Count = Observed).
Use math notation to make more compact. 
P(Rate|Count)=P(Rate)*P(Count|Rate)/P(Count).
Called Bayes theorem (Galton’s Thereom). 

"

narateTxt$Slide27 <- "Slide 27. Bayes Theorem.

Just convenient mathematics for what we have just done.
First done the way we did it today in 1880,s (F. Galton).
When I started doing it this way (2004), I was repeatedly told Imust be wrong. 
Now more widely known (125,000 and climbing - next slide).
Not the efficient way to do it - but conceptually clear, once itsinks in , once it sinks in.
Today moderately complex problems can be done this way (notrepeatedly – e.g. dynamic trials, FDA recommended calibration). 
"

narateTxt$Slide28 <- "Slide 28. Popular Youtube video by a similar thinking colleague (Rasmus Bååth).

Nice introduction to Bayesian data analysis. 
Part 1: What is Bayes? 
Suggest just from 13.05 to 25.33 minutes.
Same approach but different vocabulary:
Instead of universe frequencies -> Prior.simulate fake counts -> Data generating model or likelihood.compatible points in the abstract fake universes -> Posterior
Again more than 125,000 views.
" 

narateTxt$Slide29 <- "Slide 29. Math always offers advantages if done and understood correctly. 

For instance, math allows all rates between 0 and 1 (to all decimal points) and general rather than specific claim.  
Simulation can sometimes be avoided to do the analysis but always needed to verify if the analysis was truly sensible for non trivial applications in science.
Like analytical chemistry, simulation provides a lab where verification is (mostly) mechanical.  
" 

narateTxt$Slide30 <- "Slide 30. The ways Frequentist and Bayesian analyses fail even done by experts. 

The data generating model may be too different from how data was generated in our universe (selected, biased, entered wrong). 
The parameter generating model (prior) especially with multiple parameters may be miss-specified in frankly very silly ways. 
The parameter generating model may be too different from how parameter set or plausible.
Outputs (summaries) may be categorically misunderstood or poorly chosen. 
Posterior MCMC may fail (without warning).
" 

narateTxt$Slide31 <- "Slide 31. Two stage simulation allows a largely mechanical verification of most issues. 

No need to trust me or other experts if you or someone you delegate simulates (properly). 
Each point in the two stage simulation (sampled rate and fake data) has a known truth and a know to be generated according to the data generating model “observation”. 
That “observation” can be used to calculate a p-value, CI or posterior sample using MCMC. 
" 
narateTxt$Slide32 <- "Slide 32. Verifying what repeatedly happens in abstract fake universes – the new oil of statistics.

Clever statistician don’t take their own word for – they verify what repeatedly happens.or purposely challenge assumptions. 
Don Berry demonstrated this in seamless RCTs at HC last fall. 
Andrew Gelman promotes this in Bayes.
David Madigan developed this for RWE.
Cynthia Rudin advanced this for AI.
"

narateTxt$Slide33 <- "Slide 33. But we have a large lab of known truths so we can verify. 

Did the MCMC fail (as opposed to work). 
Verify type 1 and 2 errors rates and as FDA recommends even if analyses is Bayesian. 
Verify confidence interval coverage rate (seldom as advertised even for Frequentist). 
Discern the strength of the Bayesian analysis given the study design – how often posterior covers more truth than prior. 
Vary data generating model (e.g. selection) and verify the effect.
"

narateTxt$Slide34 <- "Slide 34. Nice to be omnipotent – really too nice.

For both Frequentist and Bayesian abstract fake universe exercises, lab generated as per assumptions that will be used to assess compatibility. 
Some thought should be given to make this less nice and more challenging. 
Assumption will never be exactly correct. 
This can be done by generating the abstract fake universes differently that they will be assessed. 
For instance, generate the data in a way that is biased. If using a prior, use a different one to generate parameters that assess compatibility. 
"

narateTxt$Slide35 <- "Slide 35. Take away.

Need to focus on profitable scientific inquiry. 
Need to experience statistics to really understand, skip the math if its distracting, simulate moderately complicated examples and fully dissect Bayesian modeling in the wonderful (newish) lab of abstract fake universes. 
Side step Frequentist approaches with Bayes to understand and then fully calibrate to make frequentist if and when desirable. 
Understand in batches if busy.
"

"“Not a conversation in words alone, but is illustrated, like a lecture, with diagrams and experiments.” 

Calibration as the new oil of statistics - Berry, Gelman, Madigan, Rudin, etc. - to simulation to determine acceptability. Cross-validation as degenerate simulation - hold out sample is the finite population to mechanically extrapolate to. Easy to spot problems hard if not impossible to overcome without expertise."
