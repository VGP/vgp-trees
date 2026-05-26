library(RColorBrewer)
require(tidyverse);require(ggplot2);require(scales)


for (lv in paste("l",1:6,sep="")){
dat <- merge(read.csv(paste('occupancy',lv,'txt',sep="."),h=F,s=" ") %>% rename(n=V1,Genome=V2,copies=V3), tax, by.x="Genome", by.y="X..accession") %>% 
  group_by(Genome) %>% 
  arrange(Genome, copies) %>%
  mutate(cnt = n, cntmult = n * copies, .before = Group) %>%
  ungroup() %>%
  group_by(Lineage, Group) %>%
  mutate(group_cnt = sum(cnt)) %>%
  ungroup() %>%
  group_by(Lineage) %>%
  mutate(
    group_id = dense_rank(desc(group_cnt)),
    fill_label = paste(Lineage, Group, sep = ": ")
  ) %>%
  ungroup()

if (lv=="l6") {
ncols <- max(dat$group_id)
pal <- colorRampPalette(
  brewer.pal(min(8, ncols), "Set2")
)(ncols)
fill_values <- dat %>%
  distinct(fill_label, group_id) %>%
  arrange(fill_label) %>%
  mutate(color = pal[group_id]) %>%
  { setNames(.$color, .$fill_label) }
}
ggplot(
  dat,
  aes(
    x = reorder(EnglishName, cnt, sum),
    y = cnt,
    fill = fill_label,
    alpha = cut(copies, c(0,1,2,5,500))
  )
) +
  geom_col(position = position_stack(), color="grey30", linewidth=0.15) +
  scale_fill_manual(values = fill_values, name = "") +
  scale_alpha_manual(values=c(1,0.8,0.5,0.2), name="copies") +
  ylab("count") +
  xlab("") +
  theme_classic() +
  scale_y_continuous(breaks=(1:20)*5000/ifelse(lv=="l1",10,1),expand = c(0.01, 0))+
  facet_wrap(
    ~reorder(Lineage, cnt>=1 & Group!="Otomorpha" , sum),
    #~Lineage,
    scales="free_x",
    nrow=1,
    space="free_x"
  ) +
  theme(
    axis.text.x = element_text(angle=90,hjust=1,vjust=0.5,size=2.5), 
    legend.position = "bottom",
    panel.grid.major.y = element_line(color="grey"),
    panel.grid.minor.y = element_line(color="grey", linewidth=.2)
  ) +
  guides(fill = guide_legend(nrow = 2),alpha=guide_legend(nrow = 2))
ggsave(paste('occupancy',lv,'pdf',sep="."),width=18,height = 7)  
}
