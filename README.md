# Updating Dockerfiles and Docker images

**Group Assignment: Collaboratively updating your Dockerfile and Docker image**

**Objective:**
The goal of this group assignment is to familiarize students with updating Dockerfiles and Docker images and collaborative debugging.  In this assignment, students will work together to update the Dockerfile and corresponding Docker image containing the Python environment to be used for development for future assignments and projects.  The current Dockerfile in this directory does not include any Python packages related to training deep learning models.  Each student will contribute by reviewing the Jupyter Notebook for the lab on deep learning from the ISLP textbook, discussing as a group to figure out which additional packages are needed, and updating the Dockerfile to include **specific packages and specific versions** needed to run the Jupyter notebook successfully in an organized manner.  

**Instructions:**

**Step 1: Identifying additional packages needed**

1. After you accept the assignment, you will need to join the group corresponding to your assigned group on Canvas.

2. Review the Jupyter notebook containing the lab for Chapter 10 if the ISLP textbook, which has been reproduced from this link (https://github.com/intro-stat-learning/ISLP_labs/blob/main/Ch10-deeplearning-lab.ipynb) into this repository for your convenience.  Throughout the notebook, specific packages are imported using the ```from``` and ```import``` commands.  Make note of the packages that are being imported.
   
3. Review the Dockerfile in the repository and determine which of the packages from Step 1.2 are not already included.  For these packages, go to PyPI (https://pypi.org/) and find the latest version for each of these packages.  For example, the latest version of NumPy is 1.26.4 (https://pypi.org/project/numpy/).  You will need to update the existing Dockerfile by adding these packages and their latest versions after the ```RUN pip install``` command.

**Step 2: Updating and debugging the Dockerfile**

**Note:** This step would be most easily accomplished by working together simultaneously as a group.  I recommend scheduling a group meeting (in person or virtually), and working through the steps below to update and debug the Dockerfile as a team.  This way you can discuss errors, decide on appropriate packages and versions, and merge pull requests from individual team members to create one finalized Dockerfile.  

1. Clone the group assignment repo onto your local machine and create a dev branch.  You can reference the following the instructions in the PRdemo repo (https://github.com/sbruce23/PRdemo) for how to do this.

2. Modify the Dockerfile on your local machine in the dev branch by adding the **specific packages and specific versions** to the Dockerfile needed to run the deep learning notebook.  You can use any text editor you wish to make these changes.  It is recommended to avoid copying and pasting package names and version numbers. Type everything out. 
  
3. Open a terminal or PowerShell instance and navigate to the directory containing the updated Dockerfile, and build the image using the command ```docker build -t pynb_devenv:0.0.2 .```.  This will create a new tag (0.0.2) for your existing pynb_devenv image.  

4. When you run the build command, **you will encounter errors after adding the other packages**.  These errors are due to specific packages requiring particular versions of other packages (i.e. package dependencies) that are not currently satisfied with the existing versions specified in the original Dockerfile.  You will need to modify the specific versions requested to resolve this issues.  Read through the error messages to better understand which package dependencies are not satisifed, and modify the version of the packages to resolve the issues.  The error messages will provide information about ranges of versions for packages that can satisfy the dependency issues.

3. Repeat steps 2.2, 2.3, and 2.4 until all package dependency errors have been resolved and the package build runs successfully.

4. Once you have successfully created the image, raise a pull request (PR) with the updated Dockerfile and work together as a group to merge all PRs and resolve conflicts to produce a single finalized Dockerfile that works.

**Step 3: Test the Docker image by running the Jupyter notebook**

1. To verify that the Docker image you've created can run the Deep Learning notebook, first update the Dockerfile on your local to the latest version of the Dockerfile that was finalized in Step 2 and re-build the image using the command in Step 2.3 above.  You will then need to create a Docker container from this image using the command like ```docker run -v /Users/scottbruce/Desktop/DockerAssignment:/home/notebooks -p 8888:8888 --name pynb_devcontainer_new pynb_devenv:0.0.2```.  You will need to modify the local file path for the Docker volume specification to match your local file path (as we did in class).
   
2. Grab the URL from the terminal and open the Jupyter notebook instance in a web browser.  Open the Jupyter notebook and select the ```Restart and run all cells``` option.  If all of the cells are run successfully, then your image and Dockerfile are acceptable.

**Step 5: Finalizing the Project**

1. Once all the PRs are merged, the Dockerfile in the main branch of the group repository will be used for grading purposes.  Please make sure it is correct and reflects the correct packages and versions the group has decided upon.

2. Modify the ```GroupStatement.txt``` file to add a paragraph describing how your group worked together to complete the assignment.  Instructions are provided in the file.

**Assessment:**

Students will be assessed based on their ability to effectively use Git and GitHub for collaborative development and to correctly update the Dockerfile to be able to successfully run the Deep Learning notebook.  More specifically, the assignment is worth 10 points, and the following grading will apply:
1. +2 points for the Deep Learning notebook running successfully within the environment created using the updated Dockerfile. (Group level grade)
2. +2 points for a detailed group statement paragraph.  Points will be deducted for lack of clarity, details, and specificity. (Group level grade)
3. +2 points for merging or closing all PRs and leaving no open PRs. (Group level grade)
4. +2 points for creating at least 1 PR. (Individual level grade)
5. +2 points for reviewing at least 1 PR. (Individual level grade)

**Submission:**

There's no need for a separate submission as the progress and final deliverables will be tracked through the GitHub repository, pull requests, and merged branches. 

**Reference: Steps for Managing Merge Conflicts**

1. If conflicts arise during the PR merging process, they will be indicated in the GitHub interface.

2. Each student whose PR has conflicts should navigate to their PR on GitHub and click on the "Resolve conflicts" button.

3. GitHub will provide a side-by-side comparison of the conflicting files, allowing students to choose the correct changes for each conflict.

4. Students can edit the conflicting portions directly in the GitHub interface, choosing the desired changes from each conflicting branch.

5. Once conflicts are resolved, students can mark the conflicts as resolved within GitHub and add a comment explaining the changes made.

6. After resolving conflicts, students can request another review from a team member and, upon approval, proceed to merge the PR.
