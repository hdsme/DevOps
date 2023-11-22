1. Create a feature branch `feature/CU-xxx-Implement-feature-A` from `develop`

   > git fetch && git checkout develop && git reset origin/develop --hard && git checkout -b "feature/CU-xxx-Implement-feature-A"

2. Commit until finish the feature

   > git commit -am "commit 1"

3. Create 2 PR to `develop` and `integration` branch then ask for a review

4. If approve go to step 6

5. If reject back to step 2

6. Merge code from `feature/CU-xxx-Implement-feature-A` into `integration` branch

7. If conflict, checkout to `integration` then merge branch `feature/CU-xxx-Implement-feature-A` then solved conflict, asked people who changes the file then push to `integration`, **do not pull from `integration`.**

8. Deploy `integration` branch using jenkinks or trigger automation

9. Ask for QC to verify

10. If fail, back to step 2

11. If pass, merge code into `develop` using merge commit

12. Update release note
