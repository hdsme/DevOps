1. Checkout branch `hotfix/CU-xxx-fix...` from master
   > git fetch && git checkout master && git reset origin/master --hard && git checkout -b "hotfix/CU-xxx-fix..."
2. Commit until finish the fix

   > git commit -am "commit 1"

3. Create 2 PRs to `develop` and `master` then ask for a review

4. If approve go to step 6

5. If reject back to step 2

6. Merge code from `hotfix/CU-xxx-fix...` into `develop` branch if need to verify fix on develop.

7. Merge code from `hotfix/CU-xxx-fix...` into `master` branch.

8. Deploy prod and dev server
