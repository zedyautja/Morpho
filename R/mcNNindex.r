mcNNindex <- function(target,query,cores=detectCores(),k=k,...)
  
  {
   out <- NULL
    mclist <- list()
    nx <- dim(query)[1]
    iter <-floor(nx/cores)    
    for (i in 1:(cores-1))
      {
        mclist[[i]] <- query[(1:iter)+((i-1)*iter),]
      }
    mclist[[cores]] <-  query[-c(1:((cores-1)*iter)),]
    tmpfun <- function(x,...)
      {
        tmp0 <- nn2(target,x,k=k,searchtype="priority",...)$nn.idx
        return(tmp0)
      }
    tmp <- mclapply(mclist,tmpfun,mc.cores=cores)
    for (i in 1:cores)
      {
        out <- rbind(out,tmp[[i]])
      }
   return(out)

  }