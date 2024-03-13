test_that("multiple expert plot works", {
  v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
  p <- c(0.25, 0.5, 0.75)
  myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
  p <- plotfit(myfit, showPlot = FALSE, returnPlot = TRUE)
  vdiffr::expect_doppelganger("multiple expert plot", p)
})

test_that("multiple expert linear pool plot works", {
  v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
  p <- c(0.25, 0.5, 0.75)
  myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
  p <- plotfit(myfit, d = "gamma",  lp = T, lpw = c(2,1), ql = 0.05, qu = 0.95, ind=FALSE,
               showPlot = FALSE, returnPlot = TRUE)
  vdiffr::expect_doppelganger("multiple expert linear pool plot", p)
})


test_that("single expert plot works", {
  v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
  p <- c(0.25, 0.5, 0.75)
  myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
  p <- plotfit(myfit, d = "beta", ql = 0.05, qu = 0.95, ex = 2, showPlot = FALSE,
               returnPlot = TRUE)
  vdiffr::expect_doppelganger("single expert plot", p)
})

test_that("single expert plot works - histogram", {
  v <- matrix(c(30, 40, 50, 20, 25, 35), 3, 2)
  p <- c(0.25, 0.5, 0.75)
  myfit <- fitdist(vals = v, probs = p, lower = 0, upper = 100)
  p <- plotfit(myfit, d = "hist", ql = 0.05, qu = 0.95, ex = 2, showPlot = FALSE,
               returnPlot = TRUE)
  vdiffr::expect_doppelganger("single expert histogram plot", p)
})

test_that("CDF plot works", {
  vQuartiles <- c(30, 35, 45)
  pQuartiles<- c(0.25, 0.5, 0.75)
  myfit <- fitdist(vals = vQuartiles, probs = pQuartiles, lower = 0)
  p  <- makeCDFPlot(lower = 0, v = vQuartiles, p = pQuartiles,
              upper = 100, fit = myfit, dist = "lognormal",
              showFittedCDF = TRUE, showQuantiles = TRUE)
  
  vdiffr::expect_doppelganger("CDF plot", p)
})

test_that("quartile plot works", {
  l <- c(2, 1, 5, 1)
  u <- c(95, 90, 65, 40)
  v <- matrix(c(15, 25, 40,
                10, 20, 40,
                10, 15, 25,
                5, 10, 20),
              3, 4)
  p <- plotQuartiles(vals = v, lower = l, upper  = u)
  
  vdiffr::expect_doppelganger("quartile plot", p)
})

test_that("tertile plot works", {
  l <- c(-5, 0, 5, -10)
  u <- c(15, 35, 50, 35)
  v <- matrix(c(5, 8, 10,
                10, 15, 20,
                15, 18, 25,
                10, 20, 30),
              3, 4)
  p <- plotTertiles(vals = v, lower = l, upper  = u)
  vdiffr::expect_doppelganger("tertile plot", p)
})


test_that("distributions CDF plot works", {
  prfit <- fitprecision(interval = c(60, 70), propvals = c(0.2, 0.4), trans = "log",
                        pplot = FALSE)
  medianfit <- fitdist(vals = c(50, 60, 70), probs = c(0.05, 0.5,  0.95), lower = 0)
  p <- cdfplot(medianfit, prfit)
  vdiffr::expect_doppelganger("distributions CDF plot", p)
})