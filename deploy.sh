printf "\033[0;32mDeploying to GitHub...\033[0m\n"

load(){
    echo -e "\n"
    bar=" ===================================== "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}

checkBranch() {
  echo masukkan branch anda
  read branchs

  echo apakah branch tersebut sudah pernah anda buat? 
  echo jawab dengan y atau n
  read alreadyBranchs

  if [ $alreadyBranchs = "y" ]; then

    git checkout $branchs

  elif [ $alreadyBranchs = "n" ]; then

  git checkout -b $branchs
fi
}

addCommit(){
  echo masukkan commit anda
  read commits

  git commit -m "${commits}"
}

notGit(){
  git init
  git add .

  addCommit
  
  checkBranch

  echo add remote link
  read remoteLink
  
  git remote add origin $remoteLink
  git push origin $branchs

}

load
clear
echo masukkan path project anda
read path

cd $path

echo apakah anda sudah pernah membuat local git di project ini? 
echo jawab dengan y atau n
read alreadyGit

if [ $alreadyGit = "y" ]; then
  git add .

 addCommit

  load
  clear
  checkBranch

  git push origin $branchs

elif [ $alreadyGit = "n" ]; then
  notGit
fi
