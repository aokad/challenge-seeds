algo=bwa-mem
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo} \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name bwa-mem
    
algo=picard-sortsam
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo} \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name picard
    
algo=samtools-sort
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-1.2-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}-1.2/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo}-1.2 \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name samtools-1.2

algo=samtools-sort
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-1.9-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}-1.9/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo}-1.9 \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name samtools-1.9

algo=biobambam-bamsort
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo} \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name biobambam-0.0.191

algo=biobambam-bamsort
ecsub submit \
    --script ./bam_sorts/scripts/${algo}.sh \
    --tasks ./bam_sorts/scripts/${algo}-tasks.tsv \
    --aws-s3-bucket s3://aokad-ana-bucket/challenge/bamsort-20180831/${algo}/logs/ \
    --wdir /tmp/ecsub/ \
    --image ccatgap/challenge:bamsort-20180831-${algo} \
    --aws-ec2-instance-type t2.large \
    --disk-size 22 \
    --task_name biobambam-0.0.191
