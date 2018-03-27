# Working with repositories
In Fab Academy **we are working with git repositories**. In the past we used a single **mercurial** repository. I'll not get into the details but it was _somewhat_ annoying. Now every lab has a git repository where students push and pull their work. The advantages of working with repositories are countless, you can create branches, roll back changes, delete other people's files and many other things that you will hate very soon.

## Installing git
To install **git** in Ubuntu type in a terminal window:

`sudo apt-get install git`

## Add SSH keys to your system
 We will use a SSH connection that requires SSH keys for pulling and pushing the documentation. For now, we all all going to use the same key. Later in week 1, you will learn how to create your own SSH keypair and add it to the repository. The keys we are using are named `fab2016` (private key) and `fab2016.pub` (public key), and they are hosted in the `#general` channel of our [slack team](https://fabacademy2016.slack.com). Download and unzip the keys and move them to your `~/.ssh` folder. Finally set permissions on the private key:
```
mv fab2016 ~/.ssh
mv fab2016.pub ~/.ssh
chmod 600 ~/.ssh/fab2016
```
And now add the keys to the system:
```
eval "$(ssh-agent -s)" # Ensure ssh-agent is enabled
ssh-add ~/.ssh/fab2016   # Add your SSH key to the ssh-agent
```

## Clone the repository
Please find below the SSH address to clone the repository. In your computer, inside a terminal window, navigate to where you want to clone the repository (**recommended your home directory**):

```
cd ~
git clone REPLACE_THIS_WITH_GIT_SSH_ADDRESS
```
Lab | SSH address | Folder created
--- | --- | ---
Trivandrum | git@git.fabacademy.org:fabacademy2016/fablabtrivandrum.git | fablabtrivandrum
Kochi | git@git.fabacademy.org:fabacademy2016/fablabkochi.git | fablabkochi
Vigyan Ashram | git@git.fabacademy.org:fabacademy2016/fablabvigyanashram.git | fablabvigyanashram
Bahrain | git@git.fabacademy.org:fabacademy2016/fablabbahrain.git | fablabbahrain

## Configuring git
Set some basic config and tell git who you are. Maybe I don't have to say that, but replace **yourname** with your actual name and **youremail** with your email address.
```
cd ~/folder_name # replace this with your repository folder
git config --global user.name "yourname" #set name for commits
git config --global user.email "youremail" #set email for commits
git config --global push.default simple #default push only the current branch
git config --global pull.rebase true  #rebase rather commit automatic merges
git config --global fetch.prune true #locally prune branches that are remotely deleted
git config --global core.editor atom #set the editor
```

## Basic git workflow
This is the basic git workflow. Once you have made all changes to your website (hopefully daily), upload those changes to the repository. **Very important:** Do not miss any step, and do them in order.
```
cd ~/folder_name          # go to the repository folder
git pull                  # pull other students changes
git add --all             # add your changes
git commit -m "message"   # write a meaningful message
git push
```
This is the manual workflow of updating your page. You can also write a script and  [automate this process](.doc.html).

## Where is the webpage?
The webpage is here:

Lab | HTML address
--- | ---
Trivandrum | <http://archive.fabacademy.org/archives/2016/fablabtrivandrum>
Kochi | <http://archive.fabacademy.org/archives/2016/fablabkochi>
Vigyan Ashram | <http://archive.fabacademy.org/archives/2016/fablabvigyanashram>
Bahrain | <http://archive.fabacademy.org/archives/2016/fablabbahrain>

## Troubleshooting

### SSH connection not working
Sometimes git asks for my repository password even if I have specified to use SSH keys. So what I do is check if the keys are in the **ssh-agent**:
```
$ ssh-add -l
Could not open a connection to your authentication agent.
```
In this case the **ssh-agent** was not running, so I start it using:
```
$ eval `ssh-agent -s`
Agent pid 3032
```
I check again and now the problem is that the agent has no identities:
```
$ ssh-add -l
The agent has no identities.
```
I list the keys in my `.ssh` folder:
```
$ ls ~/.ssh
academy  academy.pub  config  known_hosts
```
I add the `academy` key, which is the key I added in git
```
$ ssh-add ~/.ssh/academy
Identity added: /home/irix/.ssh/academy (/home/irix/.ssh/academy)
```
I check again:
```
$ ssh-add -l
2048 SHA256:D0Yg6HyzIzD9mIIpytearRhVc2YMYEtIpqP664EjEzU /home/irix/.ssh/academy (RSA)
```
An then, git pull and push using SSH works again. I still don't know why this happens, I suspect this is something related when I put the computer to sleep and it awakes in another wifi network. If I restart the computer these steps are not required.
