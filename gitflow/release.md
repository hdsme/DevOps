1. Create a release branch `release/20210129` from `develop`

   > git fetch && git checkout develop && git reset origin/develop --hard && git checkout -b "release/20210129"

2. If we don't have staging server. Go to step 6

3. If we have staging server, then deploy branch `release/20210129` to staging.

4. Ask QC to verify all the ticket. If pass, go to step 6.

5. If failed, checkout branch `hotfix/fix-...` from `release/20210129` a branch, fix and create PR to `release/20210129`. Then go to step 3.

6. Bump verison then commit

   > git commit -am "bump version"

7. Update `CHANGELOG.md`, create git tag with version

8. Merge `release/20210129` to `master` and `develop` then deploy develop and prod server.
