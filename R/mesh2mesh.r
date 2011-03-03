mesh2mesh<-function(mesh1,tarmesh,clean=TRUE)
{
  if (!is.character(tarmesh))
      {mesh2ply(tarmesh,"target")
       tarply <- "target.ply"
     }
  else
      {tarply <- tarmesh
     }
      vert<-t(mesh1$vb[1:3,])
      proj.back(vert,tarply)
      imp.vert<-ply2mesh("out_cloud.ply")
      outmesh<-mesh1
      outmesh$vb[1:3,]<-t(imp.vert)
	
  if (clean &&!is.character(tarmesh) )
    {
      if (!is.character(tarmesh))
          {unlink(c("target.ply"))
          }
      unlink("out_cloud.ply")
   }
  return(outmesh)
}
