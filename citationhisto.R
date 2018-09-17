citation <- hosts %>% group_by(., hOrder) %>% summarize(cites = sum(hAllZACites, na.rm=T))
citation <- arrange(citation, desc(cites))
p <- ggplot(citation, aes(x=hOrder))

# Plotting number of cited studies per order
pp <- ggplot(hosts, aes(x=hOrder, y= hAllZACites, fill = hWildDomFAO)) +
      geom_bar(stat="identity") +
      labs(x = "Order", y = "All citations", title = "Citations by Host Order") +
      theme(axis.text.x = element_text(angle = 60, hjust = 1))


pdf(file = "cites_by_order.pdf")
pp
dev.off()
