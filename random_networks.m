function   random_networks(n,max_out_degree,max_length,alpha,beta)
%n is th number of nodes
%PDF of the length of arcs is gamma(alpha,beta) distribution
exl = actxserver('excel.application');
exl.Visible = 0;
exlWkbk = exl.Workbooks;
exlFile = exlWkbk.Open('random_networks');
exlSheet1 = exlFile.Sheets.Item('Sheet1');
r=0;
out_arc=zeros(max_out_degree,2);
for i=1:n-1

    end_node=i+unidrnd(max_length,1,max(unidrnd(max_out_degree),1));
    end_node=end_node(end_node<=n);
    if isempty(end_node)
        end_node=n;
    end
    end_node = unique(end_node, 'first');
    l_end_node=length(end_node);
    out_arc(1:l_end_node,1)=i;
    out_arc(1:l_end_node,2)=end_node;
%     i
%     out_arc(1:l_end_node,:)
    dat_range = ['A' num2str(r+1) ':B' num2str(r+l_end_node)]; % Read to the last row
    exlSheet1.Range(dat_range).Value=out_arc(1:l_end_node,:);
    r=r+l_end_node;
end
% arc_length=zeros(r,1);
arc_length=gamrnd(alpha,beta,r,1);
dat_range = ['C1:C' num2str(r)]; % Read to the last row
exlSheet1.Range(dat_range).Value=arc_length;
exl.Visible = 1;
exlWkbk.Close;
exl.Quit;
end