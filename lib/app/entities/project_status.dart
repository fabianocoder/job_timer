enum ProjectStatus { 
  emAndamento(label: "Em andamento"), 
  finalizado(label: "finalizado");
  final String label;

  const ProjectStatus({required this.label});
}